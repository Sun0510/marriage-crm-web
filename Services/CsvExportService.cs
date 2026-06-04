using System.IO.Compression;
using System.Text;
using MarriageCrm.Models;

namespace MarriageCrm.Services;

public sealed class CsvExportService
{
    public byte[] CreateCsv(ExportTable table, SensitiveDataScope scope = SensitiveDataScope.Full)
    {
        var builder = new StringBuilder();
        builder.AppendLine(string.Join(",", table.Headers.Select(Escape)));

        foreach (var row in table.Rows)
        {
            var outputRow = scope == SensitiveDataScope.Full ? row : MaskRow(table.Headers, row, scope);
            builder.AppendLine(string.Join(",", outputRow.Select(Escape)));
        }

        var encoding = new UTF8Encoding(encoderShouldEmitUTF8Identifier: true);
        var preamble = encoding.GetPreamble();
        var content = encoding.GetBytes(builder.ToString());
        var output = new byte[preamble.Length + content.Length];
        Buffer.BlockCopy(preamble, 0, output, 0, preamble.Length);
        Buffer.BlockCopy(content, 0, output, preamble.Length, content.Length);
        return output;
    }

    public byte[] CreateZip(IEnumerable<ExportTable> tables, SensitiveDataScope scope = SensitiveDataScope.Full)
    {
        using var output = new MemoryStream();
        using (var archive = new ZipArchive(output, ZipArchiveMode.Create, leaveOpen: true))
        {
            foreach (var table in tables)
            {
                var entry = archive.CreateEntry(table.FileName, CompressionLevel.Fastest);
                using var stream = entry.Open();
                var bytes = CreateCsv(table, scope);
                stream.Write(bytes);
            }
        }

        return output.ToArray();
    }

    private static IReadOnlyList<string> MaskRow(IReadOnlyList<string> headers, IReadOnlyList<string> row, SensitiveDataScope scope)
    {
        var masked = new List<string>(row.Count);
        for (var index = 0; index < row.Count; index++)
        {
            var header = index < headers.Count ? headers[index] : string.Empty;
            var value = row[index];
            masked.Add(MaskValue(header, value, scope));
        }

        return masked;
    }

    private static string MaskValue(string header, string value, SensitiveDataScope scope)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return value;
        }

        if (scope == SensitiveDataScope.SeniorCounselor &&
            header is "address" or "annual_income" or "family_details" or
                      "sensitive_details" or "matched_customer_name" or "feedback" or "counselor_evaluation")
        {
            return value;
        }

        return header switch
        {
            "address" => AddressRegion(value),
            "annual_income" => IncomeBand(value),
            "family_details" => "선임 이상 권한 필요",
            "asset_summary" => "부장 이상 권한 필요",
            "past_history" => "부장 이상 권한 필요",
            "sensitive_details" => "선임 이상 권한 필요",
            "payment_amount" => "부장 이상 권한 필요",
            "feedback" => "선임 이상 권한 필요",
            "counselor_evaluation" => "선임 이상 권한 필요",
            _ => value
        };
    }

    private static string IncomeBand(string value) =>
        decimal.TryParse(value, out var amount)
            ? $"{Math.Floor(amount / 10000000m) * 1000:N0}만원대"
            : "소득 구간 비공개";

    private static string AddressRegion(string value)
    {
        var parts = value.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        return parts.Length >= 2 ? $"{parts[0]} {parts[1]}" : value;
    }

    private static string Escape(string? value)
    {
        var safeValue = value ?? string.Empty;
        if (safeValue.Length > 0 && "=+-@".Contains(safeValue[0]))
        {
            safeValue = "'" + safeValue;
        }

        return "\"" + safeValue.Replace("\"", "\"\"") + "\"";
    }
}
