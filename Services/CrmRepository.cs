using System.Data;
using MarriageCrm.Models;
using Microsoft.Data.SqlClient;

namespace MarriageCrm.Services;

public sealed class CrmRepository
{
    private readonly string _connectionString;

    public CrmRepository(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("CrmDatabase")
            ?? throw new InvalidOperationException(
                "ConnectionStrings:CrmDatabase is not configured. Set it in appsettings.Production.json or an environment variable.");
    }

    public async Task<DashboardStats> GetDashboardStatsAsync()
    {
        const string sql = """
            SELECT
                (SELECT COUNT(*) FROM dbo.customers),
                (SELECT COUNT(*) FROM dbo.contracts WHERE contract_status = N'유효'),
                (SELECT COUNT(*) FROM dbo.consulting_notes),
                (SELECT COUNT(*) FROM dbo.matching_history),
                (SELECT COUNT(*) FROM dbo.uploaded_files WHERE uploaded_at >= DATEADD(day, -7, SYSUTCDATETIME()));
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        await using var reader = await command.ExecuteReaderAsync();
        await reader.ReadAsync();

        return new DashboardStats(
            reader.GetInt32(0),
            reader.GetInt32(1),
            reader.GetInt32(2),
            reader.GetInt32(3),
            reader.GetInt32(4));
    }

    public async Task<AppUserAuth?> GetAppUserForLoginAsync(string username)
    {
        const string sql = """
            SELECT TOP (1)
                id, username, display_name, role, is_active,
                password_salt, password_hash, password_iterations
            FROM dbo.app_users
            WHERE username = @username;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 80)
        {
            Value = username
        });

        await using var reader = await command.ExecuteReaderAsync();
        if (!await reader.ReadAsync())
        {
            return null;
        }

        return new AppUserAuth(
            reader.GetInt32(0),
            reader.GetString(1),
            reader.GetString(2),
            reader.GetString(3),
            reader.GetBoolean(4),
            (byte[])reader.GetValue(5),
            (byte[])reader.GetValue(6),
            reader.GetInt32(7));
    }

    public async Task<string?> GetAppUserDisplayNameAsync(string username)
    {
        if (string.IsNullOrWhiteSpace(username))
        {
            return null;
        }

        const string sql = """
            SELECT TOP (1) display_name
            FROM dbo.app_users
            WHERE username = @username
              AND is_active = 1;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@username", SqlDbType.NVarChar, 80)
        {
            Value = username
        });

        var result = await command.ExecuteScalarAsync();
        return result is string displayName && !string.IsNullOrWhiteSpace(displayName)
            ? displayName
            : null;
    }

    public async Task RecordAppUserLoginSuccessAsync(int userId)
    {
        const string sql = """
            UPDATE dbo.app_users
            SET last_login_at = SYSUTCDATETIME(),
                failed_login_count = 0
            WHERE id = @id;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = userId });
        await command.ExecuteNonQueryAsync();
    }

    public async Task RecordAppUserLoginFailureAsync(int userId)
    {
        const string sql = """
            UPDATE dbo.app_users
            SET last_failed_login_at = SYSUTCDATETIME(),
                failed_login_count = failed_login_count + 1
            WHERE id = @id;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = userId });
        await command.ExecuteNonQueryAsync();
    }

    public async Task<IReadOnlyList<AppUserSummary>> GetAppUsersAsync()
    {
        const string sql = """
            SELECT id, username, display_name, role, department, is_active,
                   created_at, last_login_at, failed_login_count
            FROM dbo.app_users
            ORDER BY role, username;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        await using var reader = await command.ExecuteReaderAsync();
        var users = new List<AppUserSummary>();

        while (await reader.ReadAsync())
        {
            users.Add(new AppUserSummary(
                reader.GetInt32(0),
                reader.GetString(1),
                reader.GetString(2),
                reader.GetString(3),
                reader.GetString(4),
                reader.GetBoolean(5),
                reader.GetDateTime(6),
                reader.IsDBNull(7) ? null : reader.GetDateTime(7),
                reader.GetInt32(8)));
        }

        return users;
    }

    public async Task<CustomerListPage> GetCustomersAsync(CustomerListFilters filters, int page, int pageSize)
    {
        pageSize = Math.Clamp(pageSize, 10, 100);
        page = Math.Max(1, page);
        var offset = (page - 1) * pageSize;

        const string countSql = """
            SELECT COUNT(*)
            FROM dbo.customers c
            OUTER APPLY (
                SELECT TOP (1) membership_level, contract_status
                FROM dbo.contracts
                WHERE customer_id = c.id
                ORDER BY contract_date DESC, id DESC
            ) latest
            WHERE (
                    @search = N''
                    OR c.name LIKE N'%' + @search + N'%'
                    OR c.gender LIKE N'%' + @search + N'%'
                    OR c.marital_history LIKE N'%' + @search + N'%'
                    OR c.phone LIKE N'%' + @search + N'%'
                    OR c.occupation LIKE N'%' + @search + N'%'
                    OR c.company_name LIKE N'%' + @search + N'%'
                    OR c.customer_grade = @search
                )
              AND (@gender = N'' OR c.gender = @gender)
              AND (@maritalHistory = N'' OR c.marital_history LIKE N'%' + @maritalHistory + N'%')
              AND (@customerGrade = N'' OR c.customer_grade = @customerGrade)
              AND (@contractStatus = N'' OR ISNULL(latest.contract_status, N'-') = @contractStatus);
            """;

        const string listSql = """
            SELECT
                c.id, c.name, c.gender, c.marital_history, c.birth_date, c.phone, c.occupation,
                c.company_name, c.customer_grade,
                ISNULL(latest.membership_level, N'-') AS membership_level,
                ISNULL(latest.contract_status, N'-') AS contract_status
            FROM dbo.customers c
            OUTER APPLY (
                SELECT TOP (1) membership_level, contract_status
                FROM dbo.contracts
                WHERE customer_id = c.id
                ORDER BY contract_date DESC, id DESC
            ) latest
            WHERE (
                    @search = N''
                    OR c.name LIKE N'%' + @search + N'%'
                    OR c.gender LIKE N'%' + @search + N'%'
                    OR c.marital_history LIKE N'%' + @search + N'%'
                    OR c.phone LIKE N'%' + @search + N'%'
                    OR c.occupation LIKE N'%' + @search + N'%'
                    OR c.company_name LIKE N'%' + @search + N'%'
                    OR c.customer_grade = @search
                )
              AND (@gender = N'' OR c.gender = @gender)
              AND (@maritalHistory = N'' OR c.marital_history LIKE N'%' + @maritalHistory + N'%')
              AND (@customerGrade = N'' OR c.customer_grade = @customerGrade)
              AND (@contractStatus = N'' OR ISNULL(latest.contract_status, N'-') = @contractStatus)
            ORDER BY c.id DESC
            OFFSET @offset ROWS FETCH NEXT @pageSize ROWS ONLY;
            """;

        await using var connection = await OpenAsync();

        await using var countCommand = new SqlCommand(countSql, connection);
        AddCustomerFilterParameters(countCommand, filters);
        var totalCount = Convert.ToInt32(await countCommand.ExecuteScalarAsync());
        var totalPages = Math.Max(1, (int)Math.Ceiling(totalCount / (double)pageSize));
        if (page > totalPages)
        {
            page = totalPages;
            offset = (page - 1) * pageSize;
        }

        await using var command = new SqlCommand(listSql, connection);
        AddCustomerFilterParameters(command, filters);
        command.Parameters.Add(new SqlParameter("@offset", SqlDbType.Int) { Value = offset });
        command.Parameters.Add(new SqlParameter("@pageSize", SqlDbType.Int) { Value = pageSize });

        var customers = new List<CustomerSummary>();
        await using var reader = await command.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            customers.Add(new CustomerSummary(
                reader.GetInt32(0),
                reader.GetString(1),
                reader.GetString(2),
                reader.GetString(3),
                DateOnly.FromDateTime(reader.GetDateTime(4)),
                reader.GetString(5),
                reader.GetString(6),
                reader.GetString(7),
                reader.GetString(8),
                reader.GetString(9),
                reader.GetString(10)));
        }

        return new CustomerListPage(customers, page, pageSize, totalCount);
    }

    public async Task<IReadOnlyList<CustomerSummary>> SearchCustomersByNameAsync(string? customerName)
    {
        if (string.IsNullOrWhiteSpace(customerName))
        {
            return [];
        }

        const string sql = """
            SELECT TOP (20)
                c.id, c.name, c.gender, c.marital_history, c.birth_date, c.phone, c.occupation,
                c.company_name, c.customer_grade,
                ISNULL(latest.membership_level, N'-') AS membership_level,
                ISNULL(latest.contract_status, N'-') AS contract_status
            FROM dbo.customers c
            OUTER APPLY (
                SELECT TOP (1) membership_level, contract_status
                FROM dbo.contracts
                WHERE customer_id = c.id
                ORDER BY contract_date DESC, id DESC
            ) latest
            WHERE c.name LIKE N'%' + @customerName + N'%'
            ORDER BY c.name, c.id;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@customerName", SqlDbType.NVarChar, 80)
        {
            Value = customerName.Trim()
        });

        var customers = new List<CustomerSummary>();
        await using var reader = await command.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            customers.Add(new CustomerSummary(
                reader.GetInt32(0),
                reader.GetString(1),
                reader.GetString(2),
                reader.GetString(3),
                DateOnly.FromDateTime(reader.GetDateTime(4)),
                reader.GetString(5),
                reader.GetString(6),
                reader.GetString(7),
                reader.GetString(8),
                reader.GetString(9),
                reader.GetString(10)));
        }

        return customers;
    }

    public async Task<IReadOnlyList<CustomerProfile>> SearchCustomerProfilesByNameAsync(string? customerName)
    {
        var summaries = await SearchCustomersByNameAsync(customerName);
        var profiles = new List<CustomerProfile>();

        foreach (var summary in summaries)
        {
            var profile = await GetCustomerAsync(summary.Id);
            if (profile is not null)
            {
                profiles.Add(profile);
            }
        }

        return profiles;
    }

    public async Task<CustomerProfile?> GetCustomerAsync(int id)
    {
        const string customerSql = """
            SELECT id, name, gender, birth_date, phone, address, occupation, company_name, education,
                   annual_income, height_cm, weight_kg, religion, hobbies, personality,
                   family_relations, family_details, asset_summary, marital_history,
                   past_history, customer_grade, created_at
            FROM dbo.customers
            WHERE id = @id;
            """;

        await using var connection = await OpenAsync();
        await using var customerCommand = new SqlCommand(customerSql, connection);
        customerCommand.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = id });
        await using var reader = await customerCommand.ExecuteReaderAsync();

        if (!await reader.ReadAsync())
        {
            return null;
        }

        var profile = new
        {
            Id = reader.GetInt32(0),
            Name = reader.GetString(1),
            Gender = reader.GetString(2),
            BirthDate = DateOnly.FromDateTime(reader.GetDateTime(3)),
            Phone = reader.GetString(4),
            Address = reader.GetString(5),
            Occupation = reader.GetString(6),
            CompanyName = reader.GetString(7),
            Education = reader.GetString(8),
            AnnualIncome = reader.GetDecimal(9),
            HeightCm = reader.GetDecimal(10),
            WeightKg = reader.GetDecimal(11),
            Religion = reader.GetString(12),
            Hobbies = reader.GetString(13),
            Personality = reader.GetString(14),
            FamilyRelations = reader.GetString(15),
            FamilyDetails = reader.GetString(16),
            AssetSummary = reader.GetString(17),
            MaritalHistory = reader.GetString(18),
            PastHistory = reader.GetString(19),
            CustomerGrade = reader.GetString(20),
            CreatedAt = reader.GetDateTime(21)
        };
        await reader.CloseAsync();

        var notes = await GetNotesAsync(connection, id);
        var contracts = await GetContractsAsync(connection, id);
        var matches = await GetMatchesAsync(connection, id);

        return new CustomerProfile(
            profile.Id,
            profile.Name,
            profile.Gender,
            profile.BirthDate,
            profile.Phone,
            profile.Address,
            profile.Occupation,
            profile.CompanyName,
            profile.Education,
            profile.AnnualIncome,
            profile.HeightCm,
            profile.WeightKg,
            profile.Religion,
            profile.Hobbies,
            profile.Personality,
            profile.FamilyRelations,
            profile.FamilyDetails,
            profile.AssetSummary,
            profile.MaritalHistory,
            profile.PastHistory,
            profile.CustomerGrade,
            profile.CreatedAt,
            notes,
            contracts,
            matches);
    }

    public async Task<int> CreateCustomerAsync(CustomerFormData customer)
    {
        const string sql = """
            INSERT INTO dbo.customers
                (name, gender, birth_date, phone, address, occupation, company_name,
                 education, annual_income, height_cm, weight_kg, religion, hobbies,
                 personality, family_relations, family_details, asset_summary,
                 marital_history, past_history, customer_grade)
            OUTPUT INSERTED.id
            VALUES
                (@name, @gender, @birthDate, @phone, @address, @occupation, @companyName,
                 @education, @annualIncome, @heightCm, @weightKg, @religion, @hobbies,
                 @personality, @familyRelations, @familyDetails, @assetSummary,
                 @maritalHistory, @pastHistory, @customerGrade);
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        AddCustomerParameters(command, customer);
        return Convert.ToInt32(await command.ExecuteScalarAsync());
    }

    public async Task<bool> UpdateCustomerAsync(int id, CustomerFormData customer)
    {
        const string sql = """
            UPDATE dbo.customers
            SET name = @name,
                gender = @gender,
                birth_date = @birthDate,
                phone = @phone,
                address = @address,
                occupation = @occupation,
                company_name = @companyName,
                education = @education,
                annual_income = @annualIncome,
                height_cm = @heightCm,
                weight_kg = @weightKg,
                religion = @religion,
                hobbies = @hobbies,
                personality = @personality,
                family_relations = @familyRelations,
                family_details = @familyDetails,
                asset_summary = @assetSummary,
                marital_history = @maritalHistory,
                past_history = @pastHistory,
                customer_grade = @customerGrade
            WHERE id = @id;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = id });
        AddCustomerParameters(command, customer);
        return await command.ExecuteNonQueryAsync() > 0;
    }

    public async Task<IReadOnlyList<UploadRecord>> GetRecentUploadsAsync()
    {
        return await GetUploadsAsync(limit: 100);
    }

    public async Task<IReadOnlyList<UploadRecord>> GetUploadsAsync(int? limit = null)
    {
        var sql = $"""
            SELECT {(limit is null ? string.Empty : $"TOP ({limit.Value})")} id, uploaded_at, uploaded_by, client_ip, original_name,
                   stored_name, mime_type, size_bytes, sha256, category
            FROM dbo.uploaded_files
            ORDER BY uploaded_at DESC;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        await using var reader = await command.ExecuteReaderAsync();
        var records = new List<UploadRecord>();

        while (await reader.ReadAsync())
        {
            records.Add(new UploadRecord(
                reader.GetInt64(0),
                reader.GetDateTime(1),
                reader.GetString(2),
                reader.GetString(3),
                reader.GetString(4),
                reader.GetString(5),
                reader.GetString(6),
                reader.GetInt64(7),
                reader.GetString(8),
                reader.GetString(9)));
        }

        return records;
    }

    public async Task<UploadRecord?> GetUploadAsync(long id)
    {
        const string sql = """
            SELECT id, uploaded_at, uploaded_by, client_ip, original_name,
                   stored_name, mime_type, size_bytes, sha256, category
            FROM dbo.uploaded_files
            WHERE id = @id;
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.BigInt) { Value = id });
        await using var reader = await command.ExecuteReaderAsync();

        if (!await reader.ReadAsync())
        {
            return null;
        }

        return new UploadRecord(
            reader.GetInt64(0),
            reader.GetDateTime(1),
            reader.GetString(2),
            reader.GetString(3),
            reader.GetString(4),
            reader.GetString(5),
            reader.GetString(6),
            reader.GetInt64(7),
            reader.GetString(8),
            reader.GetString(9));
    }

    public async Task SaveUploadAsync(UploadRecord record)
    {
        const string sql = """
            INSERT INTO dbo.uploaded_files
                (uploaded_at, uploaded_by, client_ip, original_name, stored_name,
                 mime_type, size_bytes, sha256, category)
            VALUES
                (@uploadedAt, @uploadedBy, @clientIp, @originalName, @storedName,
                 @mimeType, @sizeBytes, @sha256, @category);
            """;

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.AddWithValue("@uploadedAt", record.UploadedAt);
        command.Parameters.AddWithValue("@uploadedBy", record.UploadedBy);
        command.Parameters.AddWithValue("@clientIp", record.ClientIp);
        command.Parameters.AddWithValue("@originalName", record.OriginalName);
        command.Parameters.AddWithValue("@storedName", record.StoredName);
        command.Parameters.AddWithValue("@mimeType", record.MimeType);
        command.Parameters.AddWithValue("@sizeBytes", record.SizeBytes);
        command.Parameters.AddWithValue("@sha256", record.Sha256);
        command.Parameters.AddWithValue("@category", record.Category);
        await command.ExecuteNonQueryAsync();
    }

    public async Task<ExportTable> GetExportAsync(string exportKey)
    {
        return await GetExportAsync(exportKey, customerId: null);
    }

    public async Task<IReadOnlyList<ExportTable>> GetCustomerExportsAsync(int customerId)
    {
        var customer = await GetCustomerAsync(customerId);
        if (customer is null)
        {
            return [];
        }

        var keys = new[] { "customers", "consulting-notes", "contracts", "matching-history" };
        var tables = new List<ExportTable>();
        foreach (var key in keys)
        {
            tables.Add(await GetExportAsync(key, customerId));
        }

        return tables;
    }

    private async Task<ExportTable> GetExportAsync(string exportKey, int? customerId)
    {
        var definition = exportKey switch
        {
            "customers" => new ExportDefinition(
                "customer_dump.csv",
                ["customer_id", "name", "gender", "birth_date", "phone", "address", "occupation", "company_name", "education", "annual_income", "height_cm", "weight_kg", "religion", "hobbies", "personality", "family_relations", "family_details", "asset_summary", "marital_history", "past_history", "customer_grade"],
                """
                SELECT id, name, gender, CONVERT(varchar(10), birth_date, 23), phone, address,
                       occupation, company_name, education, CONVERT(varchar(30), annual_income),
                       CONVERT(varchar(20), height_cm), CONVERT(varchar(20), weight_kg),
                       religion, hobbies, personality, family_relations, family_details,
                       asset_summary, marital_history, past_history, customer_grade
                FROM dbo.customers
                WHERE @customerId IS NULL OR id = @customerId
                ORDER BY id;
                """),
            "consulting-notes" => new ExportDefinition(
                "consulting_notes_dump.csv",
                ["note_id", "customer_id", "customer_name", "consulted_at", "counselor_name", "preference", "counselor_note", "sensitive_details"],
                """
                SELECT n.id, n.customer_id, c.name, CONVERT(varchar(19), n.consulted_at, 120),
                       n.counselor_name, n.preference, n.counselor_note, n.sensitive_details
                FROM dbo.consulting_notes n
                JOIN dbo.customers c ON c.id = n.customer_id
                WHERE @customerId IS NULL OR n.customer_id = @customerId
                ORDER BY n.id;
                """),
            "contracts" => new ExportDefinition(
                "contracts_dump.csv",
                ["contract_id", "customer_id", "customer_name", "contract_date", "end_date", "membership_level", "payment_amount", "contract_status"],
                """
                SELECT ct.id, ct.customer_id, c.name, CONVERT(varchar(10), ct.contract_date, 23),
                       ISNULL(CONVERT(varchar(10), ct.end_date, 23), ''), ct.membership_level,
                       CONVERT(varchar(30), ct.payment_amount), ct.contract_status
                FROM dbo.contracts ct
                JOIN dbo.customers c ON c.id = ct.customer_id
                WHERE @customerId IS NULL OR ct.customer_id = @customerId
                ORDER BY ct.id;
                """),
            "matching-history" => new ExportDefinition(
                "matching_history_dump.csv",
                ["history_id", "customer_id", "customer_name", "matched_customer_id", "matched_customer_name", "matched_at", "meeting_result", "feedback", "counselor_evaluation"],
                """
                SELECT h.id, h.customer_id, c1.name, h.matched_customer_id, c2.name,
                       CONVERT(varchar(10), h.matched_at, 23), h.meeting_result,
                       h.feedback, h.counselor_evaluation
                FROM dbo.matching_history h
                JOIN dbo.customers c1 ON c1.id = h.customer_id
                JOIN dbo.customers c2 ON c2.id = h.matched_customer_id
                WHERE @customerId IS NULL OR h.customer_id = @customerId
                ORDER BY h.id;
                """),
            _ => throw new ArgumentException("Unknown export type.", nameof(exportKey))
        };

        await using var connection = await OpenAsync();
        await using var command = new SqlCommand(definition.Sql, connection);
        command.Parameters.Add(new SqlParameter("@customerId", SqlDbType.Int)
        {
            Value = customerId is null ? DBNull.Value : customerId.Value
        });
        await using var reader = await command.ExecuteReaderAsync();
        var rows = new List<IReadOnlyList<string>>();

        while (await reader.ReadAsync())
        {
            var row = new List<string>();
            for (var index = 0; index < reader.FieldCount; index++)
            {
                row.Add(reader.IsDBNull(index) ? string.Empty : Convert.ToString(reader.GetValue(index)) ?? string.Empty);
            }
            rows.Add(row);
        }

        return new ExportTable(definition.FileName, definition.Headers, rows);
    }

    private async Task<SqlConnection> OpenAsync()
    {
        var connection = new SqlConnection(_connectionString);
        await connection.OpenAsync();
        return connection;
    }

    private static void AddCustomerFilterParameters(SqlCommand command, CustomerListFilters filters)
    {
        command.Parameters.Add(new SqlParameter("@search", SqlDbType.NVarChar, 100)
        {
            Value = filters.Search
        });
        command.Parameters.Add(new SqlParameter("@gender", SqlDbType.NVarChar, 10)
        {
            Value = filters.Gender
        });
        command.Parameters.Add(new SqlParameter("@maritalHistory", SqlDbType.NVarChar, 40)
        {
            Value = filters.MaritalHistory
        });
        command.Parameters.Add(new SqlParameter("@customerGrade", SqlDbType.NVarChar, 10)
        {
            Value = filters.CustomerGrade
        });
        command.Parameters.Add(new SqlParameter("@contractStatus", SqlDbType.NVarChar, 30)
        {
            Value = filters.ContractStatus
        });
    }

    private static void AddCustomerParameters(SqlCommand command, CustomerFormData customer)
    {
        command.Parameters.Add(new SqlParameter("@name", SqlDbType.NVarChar, 80) { Value = customer.Name });
        command.Parameters.Add(new SqlParameter("@gender", SqlDbType.NVarChar, 10) { Value = customer.Gender });
        command.Parameters.Add(new SqlParameter("@birthDate", SqlDbType.Date) { Value = customer.BirthDate.ToDateTime(TimeOnly.MinValue) });
        command.Parameters.Add(new SqlParameter("@phone", SqlDbType.NVarChar, 30) { Value = customer.Phone });
        command.Parameters.Add(new SqlParameter("@address", SqlDbType.NVarChar, 255) { Value = customer.Address });
        command.Parameters.Add(new SqlParameter("@occupation", SqlDbType.NVarChar, 100) { Value = customer.Occupation });
        command.Parameters.Add(new SqlParameter("@companyName", SqlDbType.NVarChar, 120) { Value = customer.CompanyName });
        command.Parameters.Add(new SqlParameter("@education", SqlDbType.NVarChar, 100) { Value = customer.Education });
        command.Parameters.Add(new SqlParameter("@annualIncome", SqlDbType.Decimal) { Precision = 18, Scale = 0, Value = customer.AnnualIncome });
        command.Parameters.Add(new SqlParameter("@heightCm", SqlDbType.Decimal) { Precision = 5, Scale = 1, Value = customer.HeightCm });
        command.Parameters.Add(new SqlParameter("@weightKg", SqlDbType.Decimal) { Precision = 5, Scale = 1, Value = customer.WeightKg });
        command.Parameters.Add(new SqlParameter("@religion", SqlDbType.NVarChar, 60) { Value = customer.Religion });
        command.Parameters.Add(new SqlParameter("@hobbies", SqlDbType.NVarChar, 255) { Value = customer.Hobbies });
        command.Parameters.Add(new SqlParameter("@personality", SqlDbType.NVarChar, 255) { Value = customer.Personality });
        command.Parameters.Add(new SqlParameter("@familyRelations", SqlDbType.NVarChar, 255) { Value = customer.FamilyRelations });
        command.Parameters.Add(new SqlParameter("@familyDetails", SqlDbType.NVarChar, 500) { Value = customer.FamilyDetails });
        command.Parameters.Add(new SqlParameter("@assetSummary", SqlDbType.NVarChar, 500) { Value = customer.AssetSummary });
        command.Parameters.Add(new SqlParameter("@maritalHistory", SqlDbType.NVarChar, 255) { Value = customer.MaritalHistory });
        command.Parameters.Add(new SqlParameter("@pastHistory", SqlDbType.NVarChar, 500) { Value = customer.PastHistory });
        command.Parameters.Add(new SqlParameter("@customerGrade", SqlDbType.NVarChar, 10) { Value = customer.CustomerGrade });
    }

    private static async Task<IReadOnlyList<ConsultingNote>> GetNotesAsync(SqlConnection connection, int customerId)
    {
        const string sql = """
            SELECT id, consulted_at, counselor_name, preference, counselor_note, sensitive_details
            FROM dbo.consulting_notes WHERE customer_id = @id ORDER BY consulted_at DESC;
            """;
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = customerId });
        await using var reader = await command.ExecuteReaderAsync();
        var records = new List<ConsultingNote>();
        while (await reader.ReadAsync())
        {
            records.Add(new ConsultingNote(
                reader.GetInt32(0), reader.GetDateTime(1), reader.GetString(2),
                reader.GetString(3), reader.GetString(4), reader.GetString(5)));
        }
        return records;
    }

    private static async Task<IReadOnlyList<Contract>> GetContractsAsync(SqlConnection connection, int customerId)
    {
        const string sql = """
            SELECT id, contract_date, end_date, membership_level, payment_amount, contract_status
            FROM dbo.contracts WHERE customer_id = @id ORDER BY contract_date DESC;
            """;
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = customerId });
        await using var reader = await command.ExecuteReaderAsync();
        var records = new List<Contract>();
        while (await reader.ReadAsync())
        {
            records.Add(new Contract(
                reader.GetInt32(0),
                DateOnly.FromDateTime(reader.GetDateTime(1)),
                reader.IsDBNull(2) ? null : DateOnly.FromDateTime(reader.GetDateTime(2)),
                reader.GetString(3),
                reader.GetDecimal(4),
                reader.GetString(5)));
        }
        return records;
    }

    private static async Task<IReadOnlyList<MatchingHistory>> GetMatchesAsync(SqlConnection connection, int customerId)
    {
        const string sql = """
            SELECT h.id, h.matched_at, c.name, h.meeting_result, h.feedback, h.counselor_evaluation
            FROM dbo.matching_history h
            JOIN dbo.customers c ON c.id = h.matched_customer_id
            WHERE h.customer_id = @id
            ORDER BY h.matched_at DESC;
            """;
        await using var command = new SqlCommand(sql, connection);
        command.Parameters.Add(new SqlParameter("@id", SqlDbType.Int) { Value = customerId });
        await using var reader = await command.ExecuteReaderAsync();
        var records = new List<MatchingHistory>();
        while (await reader.ReadAsync())
        {
            records.Add(new MatchingHistory(
                reader.GetInt32(0),
                DateOnly.FromDateTime(reader.GetDateTime(1)),
                reader.GetString(2),
                reader.GetString(3),
                reader.GetString(4),
                reader.GetString(5)));
        }
        return records;
    }

    private sealed record ExportDefinition(
        string FileName,
        IReadOnlyList<string> Headers,
        string Sql);
}
