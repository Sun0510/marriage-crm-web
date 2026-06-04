using System.Globalization;
using System.IO.Compression;
using System.Security;
using MarriageCrm.Models;

namespace MarriageCrm.Services;

public sealed class WordExportService
{
    private readonly string _documentRoot;

    public WordExportService(IConfiguration configuration)
    {
        _documentRoot = configuration["Storage:CustomerDocumentPath"] ?? @"C:\crm-data\customer-documents";
    }

    public StoredCustomerDocument EnsureCustomerDocument(CustomerProfile customer, SensitiveDataScope scope)
    {
        var path = CustomerDocumentPath(customer, scope);
        if (!File.Exists(path))
        {
            EnsureCustomerDocuments(customer);
        }

        return new StoredCustomerDocument(path, CustomerFileName(customer, scope));
    }

    public void EnsureCustomerDocuments(CustomerProfile customer)
    {
        Directory.CreateDirectory(CustomerDirectory(customer.Id));
        foreach (var scope in new[] { SensitiveDataScope.Counselor, SensitiveDataScope.SeniorCounselor, SensitiveDataScope.Full })
        {
            var path = CustomerDocumentPath(customer, scope);
            File.WriteAllBytes(path, CreateCustomerDocument(customer, scope));
        }
    }

    public byte[] CreateStoredCustomerDocumentsZip(IEnumerable<CustomerProfile> customers, SensitiveDataScope scope)
    {
        using var output = new MemoryStream();
        using (var archive = new ZipArchive(output, ZipArchiveMode.Create, leaveOpen: true))
        {
            foreach (var customer in customers)
            {
                var stored = EnsureCustomerDocument(customer, scope);
                var entry = archive.CreateEntry(stored.FileName, CompressionLevel.Fastest);
                using var stream = entry.Open();
                using var input = File.OpenRead(stored.FilePath);
                input.CopyTo(stream);
            }
        }

        return output.ToArray();
    }

    public static string CustomerFileName(CustomerProfile customer, SensitiveDataScope scope) =>
        SafeFileName($"{customer.Id:D6}_{customer.Name}_customer_work_file_{ScopeName(scope)}.docx");

    private byte[] CreateCustomerDocument(CustomerProfile customer, SensitiveDataScope scope)
    {
        using var output = new MemoryStream();
        using (var archive = new ZipArchive(output, ZipArchiveMode.Create, leaveOpen: true))
        {
            WriteEntry(archive, "[Content_Types].xml", """
                <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
                <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
                  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
                  <Default Extension="xml" ContentType="application/xml"/>
                  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
                </Types>
                """);
            WriteEntry(archive, "_rels/.rels", """
                <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
                <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
                  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
                </Relationships>
                """);
            WriteEntry(archive, "word/document.xml", BuildDocumentXml(customer, scope));
        }

        return output.ToArray();
    }

    private string CustomerDocumentPath(CustomerProfile customer, SensitiveDataScope scope) =>
        Path.Combine(CustomerDirectory(customer.Id), CustomerFileName(customer, scope));

    private string CustomerDirectory(int customerId) =>
        Path.Combine(_documentRoot, customerId.ToString("D6", CultureInfo.InvariantCulture));

    private static string ScopeName(SensitiveDataScope scope) => scope switch
    {
        SensitiveDataScope.Counselor => "counselor",
        SensitiveDataScope.SeniorCounselor => "senior-counselor",
        _ => "full-access"
    };

    private static string BuildDocumentXml(CustomerProfile customer, SensitiveDataScope scope)
    {
        var rows = new List<string>
        {
            Title("A-Plus Counseling Operations Customer Work File"),
            Meta("Document type: customer profile and counseling work file"),
            Meta($"Employee uploaded file name: {CustomerFileName(customer, scope)}"),
            Meta($"Assumed employee upload time: {customer.CreatedAt.ToLocalTime():yyyy-MM-dd HH:mm}"),
            Meta($"Access version: {ScopeName(scope)}"),
            Spacer(),
            Section("1. Customer Basic Information"),
            Row("Customer ID", customer.Id.ToString(CultureInfo.InvariantCulture)),
            Row("Name", customer.Name),
            Row("Gender", customer.Gender),
            Row("Joined At", customer.CreatedAt.ToLocalTime().ToString("yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture)),
            Row("Birth Date", customer.BirthDate.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)),
            Row("Phone", customer.Phone),
            Row("Address", Address(customer.Address, scope)),
            Section("2. Career And Internal Grade"),
            Row("Occupation", customer.Occupation),
            Row("Company", customer.CompanyName),
            Row("Education", customer.Education),
            Row("Annual Income", Income(customer.AnnualIncome, scope)),
            Row("Customer Grade", customer.CustomerGrade),
            Section("3. Counseling Profile"),
            Row("Physical Condition", $"{customer.HeightCm:0.#}cm / {customer.WeightKg:0.#}kg"),
            Row("Religion", customer.Religion),
            Row("Hobbies", customer.Hobbies),
            Row("Personality", customer.Personality),
            Row("Family Relations", customer.FamilyRelations),
            Row("Family Details", Senior(customer.FamilyDetails, scope)),
            Row("Asset Summary", Full(customer.AssetSummary, scope)),
            Row("Marital History", customer.MaritalHistory),
            Row("Past History", Full(customer.PastHistory, scope)),
            Section("4. Counseling Notes")
        };

        if (customer.Notes.Count == 0)
        {
            rows.Add(Row("Counseling Notes", "No registered counseling note."));
        }
        else
        {
            foreach (var note in customer.Notes)
            {
                rows.Add(Row("Consulted At", note.ConsultedAt.ToString("yyyy-MM-dd HH:mm", CultureInfo.InvariantCulture)));
                rows.Add(Row("Counselor", note.CounselorName));
                rows.Add(Row("Preference", note.Preference));
                rows.Add(Row("Counselor Memo", note.CounselorNote));
                rows.Add(Row("Sensitive Details", Senior(note.SensitiveDetails, scope)));
                rows.Add(Spacer());
            }
        }

        rows.Add(Section("5. Contract Information"));
        if (customer.Contracts.Count == 0)
        {
            rows.Add(Row("Contract Information", "No registered contract."));
        }
        else
        {
            foreach (var contract in customer.Contracts)
            {
                rows.Add(Row("Contract Period", $"{contract.ContractDate:yyyy-MM-dd} ~ {contract.EndDate?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture) ?? "-"}"));
                rows.Add(Row("Membership Level", contract.MembershipLevel));
                rows.Add(Row("Payment Amount", Payment(contract.PaymentAmount, scope)));
                rows.Add(Row("Contract Status", contract.ContractStatus));
                rows.Add(Spacer());
            }
        }

        rows.Add(Section("6. Matching History"));
        if (customer.Matches.Count == 0)
        {
            rows.Add(Row("Matching History", "No registered matching history."));
        }
        else
        {
            foreach (var match in customer.Matches)
            {
                rows.Add(Row("Matched At", match.MatchedAt.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)));
                rows.Add(Row("Matched Customer", match.MatchedCustomerName));
                rows.Add(Row("Meeting Result", match.MeetingResult));
                rows.Add(Row("Feedback", Senior(match.Feedback, scope)));
                rows.Add(Row("Counselor Evaluation", Senior(match.CounselorEvaluation, scope)));
                rows.Add(Spacer());
            }
        }

        rows.Add(Meta("Lab assumption: this file is an employee-uploaded business document compiled from the customer's application form and counseling records."));

        return $$"""
            <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
            <w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
              <w:body>
                {{string.Join(Environment.NewLine, rows)}}
                <w:sectPr><w:pgSz w:w="11906" w:h="16838"/><w:pgMar w:top="1134" w:right="1134" w:bottom="1134" w:left="1134"/></w:sectPr>
              </w:body>
            </w:document>
            """;
    }

    private static string Address(string value, SensitiveDataScope scope) =>
        scope == SensitiveDataScope.Counselor ? AddressRegion(value) : value;

    private static string Income(decimal amount, SensitiveDataScope scope) =>
        scope == SensitiveDataScope.Counselor ? IncomeBand(amount) : Money(amount);

    private static string Payment(decimal amount, SensitiveDataScope scope) =>
        scope == SensitiveDataScope.Full ? Money(amount) : "Masked: manager or admin permission required";

    private static string Senior(string value, SensitiveDataScope scope) =>
        scope == SensitiveDataScope.Counselor ? "Masked: senior counselor permission required" : value;

    private static string Full(string value, SensitiveDataScope scope) =>
        scope == SensitiveDataScope.Full ? value : "Masked: manager or admin permission required";

    private static string AddressRegion(string value)
    {
        var parts = value.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        return parts.Length >= 2 ? $"{parts[0]} {parts[1]}" : value;
    }

    private static string IncomeBand(decimal amount)
    {
        var bandStart = Math.Floor(amount / 10000000m) * 10000000m;
        var bandEnd = bandStart + 9999999m;
        return $"{Money(bandStart)} - {Money(bandEnd)}";
    }

    private static string Title(string value) =>
        Paragraph(value, bold: true, fontSize: 32, color: "18324B");

    private static string Section(string value) =>
        Paragraph(value, bold: true, fontSize: 24, color: "27659A");

    private static string Meta(string value) =>
        Paragraph(value, bold: false, fontSize: 18, color: "526071");

    private static string Row(string label, string value) =>
        Paragraph($"{label}: {value}", bold: false, fontSize: 20, color: "1F2937");

    private static string Spacer() =>
        Paragraph(string.Empty, bold: false, fontSize: 8, color: "FFFFFF");

    private static string Paragraph(string value, bool bold, int fontSize, string color)
    {
        var boldXml = bold ? "<w:b/>" : string.Empty;
        return $"<w:p><w:r><w:rPr>{boldXml}<w:color w:val=\"{color}\"/><w:sz w:val=\"{fontSize}\"/></w:rPr><w:t xml:space=\"preserve\">{Escape(value)}</w:t></w:r></w:p>";
    }

    private static string Escape(string value) =>
        SecurityElement.Escape(value) ?? string.Empty;

    private static string Money(decimal amount) =>
        amount.ToString("#,##0", CultureInfo.InvariantCulture) + " KRW";

    private static void WriteEntry(ZipArchive archive, string name, string content)
    {
        var entry = archive.CreateEntry(name, CompressionLevel.Fastest);
        using var writer = new StreamWriter(entry.Open());
        writer.Write(content);
    }

    private static string SafeFileName(string value)
    {
        foreach (var invalid in Path.GetInvalidFileNameChars())
        {
            value = value.Replace(invalid, '_');
        }

        return value;
    }
}

public sealed record StoredCustomerDocument(string FilePath, string FileName);
