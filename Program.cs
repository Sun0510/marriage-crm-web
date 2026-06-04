using System.Security.Claims;
using System.Security.Cryptography;
using MarriageCrm;
using MarriageCrm.Models;
using MarriageCrm.Services;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.AspNetCore.Http.Features;

var builder = WebApplication.CreateBuilder(args);

if (builder.Environment.IsDevelopment())
{
    var localKeyPath = Path.Combine(builder.Environment.ContentRootPath, "local-data", "keys");
    Directory.CreateDirectory(localKeyPath);
    builder.Services
        .AddDataProtection()
        .SetApplicationName("MarriageCrm.Local")
        .PersistKeysToFileSystem(new DirectoryInfo(localKeyPath));
}

builder.Services
    .AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/login";
        options.AccessDeniedPath = "/login";
        options.Cookie.Name = "MarriageCrm.Session";
        options.Cookie.HttpOnly = true;
        options.Cookie.SameSite = SameSiteMode.Strict;
        options.ExpireTimeSpan = TimeSpan.FromHours(8);
        options.SlidingExpiration = true;
    });
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy => policy.RequireRole("Admin"));
});
builder.Services.AddAntiforgery(options => options.FormFieldName = "__RequestVerificationToken");
builder.Services.Configure<FormOptions>(options => options.MultipartBodyLengthLimit = 10 * 1024 * 1024);
builder.Services.AddSingleton<AuditLogger>();
builder.Services.AddSingleton<CsvExportService>();
builder.Services.AddSingleton<WordExportService>();
builder.Services.AddScoped<CrmRepository>();

var app = builder.Build();
app.UseExceptionHandler("/error");
app.UseStaticFiles();
app.UseAuthentication();
app.UseAuthorization();

app.MapGet("/", (HttpContext context) =>
    Results.Redirect(context.User.Identity?.IsAuthenticated == true ? "/dashboard" : "/login"));

app.MapGet("/login", (HttpContext context, IAntiforgery antiforgery) =>
{
    if (context.User.Identity?.IsAuthenticated == true)
    {
        return Results.Redirect("/dashboard");
    }

    return Html(WebUi.LoginPage(AntiforgeryField(context, antiforgery), error: null));
});

app.MapPost("/login", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    AuditLogger auditLogger) =>
{
    await antiforgery.ValidateRequestAsync(context);
    var form = await context.Request.ReadFormAsync();
    var username = form["username"].ToString().Trim();
    var password = form["password"].ToString();
    var account = await repository.GetAppUserForLoginAsync(username);

    if (string.IsNullOrWhiteSpace(username) || string.IsNullOrEmpty(password))
    {
        await auditLogger.WriteAsync(context, "login", "failed", new { username });
        return Html(WebUi.LoginPage(
            AntiforgeryField(context, antiforgery),
            "아이디 또는 비밀번호가 올바르지 않습니다."));
    }

    if (account is null ||
        !account.IsActive ||
        !PasswordHasher.Verify(password, account.PasswordSalt, account.PasswordHash, account.PasswordIterations))
    {
        if (account is not null)
        {
            await repository.RecordAppUserLoginFailureAsync(account.Id);
        }

        await auditLogger.WriteAsync(context, "login", "failed", new { username });
        return Html(WebUi.LoginPage(
            AntiforgeryField(context, antiforgery),
            "아이디 또는 비밀번호가 올바르지 않습니다."));
    }

    await repository.RecordAppUserLoginSuccessAsync(account.Id);
    var claims = new[]
    {
        new Claim(ClaimTypes.Name, account.Username),
        new Claim(ClaimTypes.Role, account.Role),
        new Claim("display_name", string.IsNullOrWhiteSpace(account.DisplayName) ? account.Username : account.DisplayName)
    };
    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
    await context.SignInAsync(
        CookieAuthenticationDefaults.AuthenticationScheme,
        new ClaimsPrincipal(identity));
    await auditLogger.WriteAsync(context, "login", "success");
    return Results.Redirect(account.Role.Equals(AccessPolicy.Admin, StringComparison.OrdinalIgnoreCase) ? "/admin" : "/dashboard");
});

app.MapGet("/error", () => Html(WebUi.ErrorPage()));

var secured = app.MapGroup(string.Empty).RequireAuthorization();

secured.MapPost("/logout", async (
    HttpContext context,
    IAntiforgery antiforgery,
    AuditLogger auditLogger) =>
{
    await antiforgery.ValidateRequestAsync(context);
    await auditLogger.WriteAsync(context, "logout", "success");
    await context.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
    return Results.Redirect("/login");
});

secured.MapGet("/dashboard", async (HttpContext context, IAntiforgery antiforgery, CrmRepository repository) =>
{
    var stats = await repository.GetDashboardStatsAsync();
    return Html(WebUi.DashboardPage(context, AntiforgeryField(context, antiforgery), stats));
});

secured.MapGet("/admin", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository) =>
{
    if (!context.User.IsInRole(AccessPolicy.Admin))
    {
        return Results.Forbid();
    }

    var stats = await repository.GetDashboardStatsAsync();
    var uploads = await repository.GetRecentUploadsAsync();
    var accounts = await repository.GetAppUsersAsync();
    return Html(WebUi.AdminPage(
        context,
        AntiforgeryField(context, antiforgery),
        stats,
        uploads.Take(10).ToList(),
        accounts,
        app.Configuration["Storage:AuditLogPath"] ?? string.Empty));
});

secured.MapGet("/customers", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    string? search,
    string? gender,
    string? maritalHistory,
    string? customerGrade,
    string? contractStatus,
    int? page) =>
{
    var filters = new CustomerListFilters(
        search?.Trim() ?? string.Empty,
        gender?.Trim() ?? string.Empty,
        maritalHistory?.Trim() ?? string.Empty,
        customerGrade?.Trim() ?? string.Empty,
        contractStatus?.Trim() ?? string.Empty);
    var customerPage = await repository.GetCustomersAsync(filters, page ?? 1, pageSize: 50);
    return Html(WebUi.CustomersPage(
        context,
        AntiforgeryField(context, antiforgery),
        customerPage,
        filters));
});

secured.MapGet("/customers/new", (
    HttpContext context,
    IAntiforgery antiforgery) =>
{
    return Html(WebUi.CustomerFormPage(
        context,
        AntiforgeryField(context, antiforgery),
        "신규 고객 등록",
        "/customers/new",
        CustomerFormData.Empty,
        error: null,
        sourceCustomerId: null));
});

secured.MapPost("/customers/new", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    WordExportService wordExportService,
    AuditLogger auditLogger) =>
{
    await antiforgery.ValidateRequestAsync(context);
    var (customer, error) = await ReadCustomerFormAsync(context);
    if (error is not null)
    {
        return Html(WebUi.CustomerFormPage(
            context,
            AntiforgeryField(context, antiforgery),
            "신규 고객 등록",
            "/customers/new",
            customer,
            error,
            sourceCustomerId: null));
    }

    var customerId = await repository.CreateCustomerAsync(customer);
    var profile = await repository.GetCustomerAsync(customerId);
    if (profile is not null)
    {
        wordExportService.EnsureCustomerDocuments(profile);
    }
    await auditLogger.WriteAsync(
        context,
        "customer_create",
        "success",
        new { customerId, customer.Name, customer.Phone });
    return Results.Redirect($"/customers/{customerId}");
});

secured.MapGet("/customers/{id:int}/edit", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    int id) =>
{
    var customer = await repository.GetCustomerAsync(id);
    return customer is null
        ? Results.NotFound()
        : Html(WebUi.CustomerFormPage(
            context,
            AntiforgeryField(context, antiforgery),
            "고객 정보 수정",
            $"/customers/{id}/edit",
            CustomerFormFromProfile(customer),
            error: null,
            sourceCustomerId: id));
});

secured.MapPost("/customers/{id:int}/edit", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    WordExportService wordExportService,
    AuditLogger auditLogger,
    int id) =>
{
    await antiforgery.ValidateRequestAsync(context);
    var (customer, error) = await ReadCustomerFormAsync(context);
    if (error is not null)
    {
        return Html(WebUi.CustomerFormPage(
            context,
            AntiforgeryField(context, antiforgery),
            "고객 정보 수정",
            $"/customers/{id}/edit",
            customer,
            error,
            sourceCustomerId: id));
    }

    var updated = await repository.UpdateCustomerAsync(id, customer);
    if (!updated)
    {
        return Results.NotFound();
    }

    var profile = await repository.GetCustomerAsync(id);
    if (profile is not null)
    {
        wordExportService.EnsureCustomerDocuments(profile);
    }

    await auditLogger.WriteAsync(
        context,
        "customer_update",
        "success",
        new { customerId = id, customer.Name, customer.Phone });
    return Results.Redirect($"/customers/{id}");
});

secured.MapGet("/customers/{id:int}", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    int id) =>
{
    var customer = await repository.GetCustomerAsync(id);
    return customer is null
        ? Results.NotFound()
        : Html(WebUi.CustomerPage(context, AntiforgeryField(context, antiforgery), customer));
});

secured.MapGet("/uploads", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    string? status) =>
{
    var uploads = await repository.GetRecentUploadsAsync();
    return Html(WebUi.UploadsPage(
        context,
        AntiforgeryField(context, antiforgery),
        uploads,
        status));
});

secured.MapPost("/uploads", async (
    HttpContext context,
    IAntiforgery antiforgery,
    IConfiguration configuration,
    CrmRepository repository,
    AuditLogger auditLogger) =>
{
    await antiforgery.ValidateRequestAsync(context);
    var form = await context.Request.ReadFormAsync();
    var file = form.Files.GetFile("attachment");
    var category = form["category"].ToString();
    var allowedCategories = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
    {
        "CUSTOMER_DOCUMENT", "CONSULTING_MATERIAL", "CONTRACT"
    };
    var allowedExtensions = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
    {
        ".pdf", ".doc", ".docx", ".xlsx", ".jpg", ".jpeg", ".png", ".txt"
    };

    if (file is null || file.Length == 0 || file.Length > 10 * 1024 * 1024)
    {
        await auditLogger.WriteAsync(context, "file_upload", "rejected", new { reason = "invalid_size" });
        return Results.Redirect("/uploads?status=invalid-size");
    }

    var originalName = Path.GetFileName(file.FileName);
    var extension = Path.GetExtension(originalName);
    if (!allowedExtensions.Contains(extension) || !allowedCategories.Contains(category))
    {
        await auditLogger.WriteAsync(
            context,
            "file_upload",
            "rejected",
            new { reason = "invalid_type", originalName, category });
        return Results.Redirect("/uploads?status=invalid-type");
    }

    var uploadPath = configuration["Storage:UploadPath"]
        ?? throw new InvalidOperationException("Storage:UploadPath is not configured.");
    Directory.CreateDirectory(uploadPath);
    var storedName = $"{Guid.NewGuid():N}{extension.ToLowerInvariant()}";
    var storedPath = Path.Combine(uploadPath, storedName);

    await using (var output = new FileStream(storedPath, FileMode.CreateNew, FileAccess.Write, FileShare.None))
    {
        await file.CopyToAsync(output);
    }

    string sha256;
    await using (var input = File.OpenRead(storedPath))
    {
        sha256 = Convert.ToHexString(await SHA256.HashDataAsync(input)).ToLowerInvariant();
    }

    var record = new UploadRecord(
        0,
        DateTime.UtcNow,
        context.User.Identity?.Name ?? "unknown",
        context.Connection.RemoteIpAddress?.ToString() ?? "unknown",
        originalName,
        storedName,
        file.ContentType ?? "application/octet-stream",
        file.Length,
        sha256,
        category);

    try
    {
        await repository.SaveUploadAsync(record);
    }
    catch
    {
        File.Delete(storedPath);
        throw;
    }

    await auditLogger.WriteAsync(
        context,
        "file_upload",
        "accepted",
        new { originalName, storedName, file.Length, sha256, category });
    return Results.Redirect("/uploads?status=uploaded");
});

secured.MapGet("/reports", async (
    HttpContext context,
    IAntiforgery antiforgery,
    CrmRepository repository,
    string? customerName) =>
{
    var customers = await repository.SearchCustomersByNameAsync(customerName);
    return Html(WebUi.ReportsPage(
        context,
        AntiforgeryField(context, antiforgery),
        customers,
        customerName ?? string.Empty));
});

secured.MapGet("/reports/export/{exportKey}", async (
    HttpContext context,
    CrmRepository repository,
    CsvExportService csvExportService,
    AuditLogger auditLogger,
    string exportKey) =>
{
    try
    {
        var dataScope = AccessPolicy.GetSensitiveDataScope(context.User);
        var table = await repository.GetExportAsync(exportKey);
        var bytes = csvExportService.CreateCsv(table, dataScope);
        await auditLogger.WriteAsync(
            context,
            "csv_export",
            "success",
            new { exportKey, table.FileName, rowCount = table.Rows.Count });
        return Results.File(bytes, "text/csv; charset=utf-8", table.FileName);
    }
    catch (ArgumentException)
    {
        return Results.NotFound();
    }
});

secured.MapGet("/reports/export-search", async (
    HttpContext context,
    CrmRepository repository,
    WordExportService wordExportService,
    AuditLogger auditLogger) =>
{
    var customerName = context.Request.Query["customerName"].ToString();
    var customers = await repository.SearchCustomerProfilesByNameAsync(customerName);
    if (customers.Count == 0)
    {
        return Results.NotFound();
    }

    var dataScope = AccessPolicy.GetSensitiveDataScope(context.User);
    var bytes = wordExportService.CreateStoredCustomerDocumentsZip(customers, dataScope);
    await auditLogger.WriteAsync(
        context,
        "customer_search_docx_export_bundle",
        "success",
        new { customerName, customerIds = customers.Select(customer => customer.Id), fileCount = customers.Count });
    return Results.File(bytes, "application/zip", $"customer_search_{DateTime.UtcNow:yyyyMMdd_HHmmss}.zip");
});

secured.MapGet("/customers/{id:int}/export", async (
    HttpContext context,
    CrmRepository repository,
    WordExportService wordExportService,
    AuditLogger auditLogger,
    int id) =>
{
    var customer = await repository.GetCustomerAsync(id);
    if (customer is null)
    {
        return Results.NotFound();
    }

    var dataScope = AccessPolicy.GetSensitiveDataScope(context.User);
    var stored = wordExportService.EnsureCustomerDocument(customer, dataScope);
    await auditLogger.WriteAsync(
        context,
        "customer_docx_export",
        "success",
        new { customerId = id, fileName = stored.FileName, storedPath = stored.FilePath });
    return Results.File(
        stored.FilePath,
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
        stored.FileName);
});

app.Run();

static IResult Html(string content) => Results.Content(content, "text/html; charset=utf-8");

static string AntiforgeryField(HttpContext context, IAntiforgery antiforgery)
{
    var tokens = antiforgery.GetAndStoreTokens(context);
    return $"<input type=\"hidden\" name=\"{WebUi.E(tokens.FormFieldName!)}\" value=\"{WebUi.E(tokens.RequestToken!)}\">";
}

static async Task<(CustomerFormData Customer, string? Error)> ReadCustomerFormAsync(HttpContext context)
{
    var form = await context.Request.ReadFormAsync();
    var customer = new CustomerFormData(
        Clean(form["name"]),
        Allowed(Clean(form["gender"]), ["남성", "여성", "비공개"], "비공개"),
        ParseDate(Clean(form["birthDate"]), CustomerFormData.Empty.BirthDate),
        Clean(form["phone"]),
        Clean(form["address"]),
        Clean(form["occupation"]),
        Clean(form["companyName"]),
        Clean(form["education"]),
        ParseDecimal(Clean(form["annualIncome"]), 0),
        ParseDecimal(Clean(form["heightCm"]), 170),
        ParseDecimal(Clean(form["weightKg"]), 65),
        Default(Clean(form["religion"]), "무교"),
        Clean(form["hobbies"]),
        Clean(form["personality"]),
        Clean(form["familyRelations"]),
        Clean(form["familyDetails"]),
        Clean(form["assetSummary"]),
        Default(Clean(form["maritalHistory"]), "미혼"),
        Default(Clean(form["pastHistory"]), "특이 과거 이력 없음"),
        Allowed(Clean(form["customerGrade"]), ["S", "A", "B"], "B"));

    var requiredMissing =
        string.IsNullOrWhiteSpace(customer.Name) ||
        string.IsNullOrWhiteSpace(customer.Phone) ||
        string.IsNullOrWhiteSpace(customer.Address) ||
        string.IsNullOrWhiteSpace(customer.Occupation) ||
        string.IsNullOrWhiteSpace(customer.CompanyName) ||
        string.IsNullOrWhiteSpace(customer.Education) ||
        string.IsNullOrWhiteSpace(customer.FamilyRelations);

    if (requiredMissing)
    {
        return (customer, "필수 입력 항목을 모두 입력해 주세요.");
    }

    if (customer.AnnualIncome < 0 || customer.HeightCm is < 130 or > 220 || customer.WeightKg is < 35 or > 160)
    {
        return (customer, "연소득, 키, 몸무게 입력값을 확인해 주세요.");
    }

    return (customer, null);
}

static CustomerFormData CustomerFormFromProfile(CustomerProfile customer) => new(
    customer.Name,
    customer.Gender,
    customer.BirthDate,
    customer.Phone,
    customer.Address,
    customer.Occupation,
    customer.CompanyName,
    customer.Education,
    customer.AnnualIncome,
    customer.HeightCm,
    customer.WeightKg,
    customer.Religion,
    customer.Hobbies,
    customer.Personality,
    customer.FamilyRelations,
    customer.FamilyDetails,
    customer.AssetSummary,
    customer.MaritalHistory,
    customer.PastHistory,
    customer.CustomerGrade);

static string Clean(string? value) => (value ?? string.Empty).Trim();

static string Default(string value, string fallback) => string.IsNullOrWhiteSpace(value) ? fallback : value;

static string Allowed(string value, string[] allowed, string fallback) =>
    allowed.Contains(value, StringComparer.OrdinalIgnoreCase) ? value : fallback;

static DateOnly ParseDate(string value, DateOnly fallback) =>
    DateOnly.TryParse(value, out var parsed) ? parsed : fallback;

static decimal ParseDecimal(string value, decimal fallback) =>
    decimal.TryParse(value, out var parsed) ? parsed : fallback;
