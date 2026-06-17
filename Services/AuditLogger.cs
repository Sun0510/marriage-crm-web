using System.Text.Json;

namespace MarriageCrm.Services;

public sealed class AuditLogger
{
    private readonly string _logDirectory;
    private readonly string _logFileBaseName;
    private readonly SemaphoreSlim _writeLock = new(1, 1);

    public AuditLogger(IConfiguration configuration)
    {
        var configuredLogPath = configuration["Storage:AuditLogPath"]
            ?? throw new InvalidOperationException("Storage:AuditLogPath is not configured.");

        _logDirectory = Path.GetDirectoryName(configuredLogPath)
            ?? throw new InvalidOperationException("The audit log directory is invalid.");
        _logFileBaseName = Path.GetFileNameWithoutExtension(configuredLogPath);

        Directory.CreateDirectory(_logDirectory);
    }

    public async Task WriteAsync(
        HttpContext context,
        string action,
        string result,
        object? details = null)
    {
        var timestamp = KoreanClock.Now;
        var entry = new
        {
            timestamp,
            action,
            result,
            user = context.User.Identity?.Name ?? "anonymous",
            sourceIp = context.Connection.RemoteIpAddress?.ToString() ?? "unknown",
            method = context.Request.Method,
            path = context.Request.Path.Value,
            details
        };

        var json = JsonSerializer.Serialize(entry);
        await _writeLock.WaitAsync();
        try
        {
            var monthKey = timestamp.ToString("yyyy-MM");
            var monthlyLogDirectory = Path.Combine(_logDirectory, monthKey);
            Directory.CreateDirectory(monthlyLogDirectory);

            var monthlyLogFileName = $"{_logFileBaseName}-{monthKey}.log";
            var monthlyLogPath = Path.Combine(monthlyLogDirectory, monthlyLogFileName);
            await File.AppendAllTextAsync(monthlyLogPath, json + Environment.NewLine);
        }
        finally
        {
            _writeLock.Release();
        }
    }
}
