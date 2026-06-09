using System.Globalization;
using System.IO.Compression;
using MarriageCrm.Models;

namespace MarriageCrm.Services;

public sealed class WordExportService
{
    private readonly string _documentRoot;

    public WordExportService(IConfiguration configuration, IWebHostEnvironment environment)
    {
        var configuredPath = configuration["Storage:CustomerDocumentPath"] ?? "customer-documents";
        _documentRoot = Path.GetFullPath(Path.IsPathRooted(configuredPath)
            ? configuredPath
            : Path.Combine(environment.ContentRootPath, configuredPath));
    }

    public StoredCustomerDocument GetCustomerDocument(CustomerProfile customer, SensitiveDataScope scope)
    {
        var path = CustomerDocumentPath(customer, scope);
        if (!File.Exists(path))
        {
            path = FindCustomerDocumentByNumber(customer.Id, scope)
                ?? throw new FileNotFoundException("The stored customer Word document was not found.", path);
        }

        return new StoredCustomerDocument(path, Path.GetFileName(path));
    }

    public byte[] CreateStoredCustomerDocumentsZip(IEnumerable<CustomerProfile> customers, SensitiveDataScope scope)
    {
        using var output = new MemoryStream();
        using (var archive = new ZipArchive(output, ZipArchiveMode.Create, leaveOpen: true))
        {
            foreach (var customer in customers)
            {
                var stored = GetCustomerDocument(customer, scope);
                var entry = archive.CreateEntry(stored.FileName, CompressionLevel.Fastest);
                using var stream = entry.Open();
                using var input = File.OpenRead(stored.FilePath);
                input.CopyTo(stream);
            }
        }

        return output.ToArray();
    }

    public static string CustomerFileName(CustomerProfile customer, SensitiveDataScope scope) =>
        SafeFileName($"{customer.Name}_{customer.Id.ToString("D6", CultureInfo.InvariantCulture)}_{PermissionNumber(scope)}.docx");

    private string CustomerDocumentPath(CustomerProfile customer, SensitiveDataScope scope) =>
        Path.Combine(CustomerDirectory(customer.Id), CustomerFileName(customer, scope));

    private string CustomerDirectory(int customerId) =>
        Path.Combine(_documentRoot, customerId.ToString("D6", CultureInfo.InvariantCulture));

    private string? FindCustomerDocumentByNumber(int customerId, SensitiveDataScope scope)
    {
        var directory = CustomerDirectory(customerId);
        if (!Directory.Exists(directory))
        {
            return null;
        }

        var pattern = $"*_{customerId.ToString("D6", CultureInfo.InvariantCulture)}_{PermissionNumber(scope)}.docx";
        return Directory.GetFiles(directory, pattern).OrderBy(path => path, StringComparer.OrdinalIgnoreCase).FirstOrDefault();
    }

    private static int PermissionNumber(SensitiveDataScope scope) => scope switch
    {
        SensitiveDataScope.Counselor => 1,
        SensitiveDataScope.SeniorCounselor => 2,
        _ => 3
    };

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
