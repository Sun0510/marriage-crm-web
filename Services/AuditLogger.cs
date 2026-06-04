using System.Text.Json;

namespace MarriageCrm.Services;

public sealed class AuditLogger
{
    private readonly string _logPath;
    private readonly SemaphoreSlim _writeLock = new(1, 1);

    public AuditLogger(IConfiguration configuration)
    {
        _logPath = configuration["Storage:AuditLogPath"]
            ?? throw new InvalidOperationException("Storage:AuditLogPath is not configured.");

        var directory = Path.GetDirectoryName(_logPath)
            ?? throw new InvalidOperationException("The audit log directory is invalid.");
        Directory.CreateDirectory(directory);
    }

    public async Task WriteAsync(
        HttpContext context,
        string action,
        string result,
        object? details = null)
    {
        var entry = new
        {
            timestamp = DateTimeOffset.UtcNow,
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
            await File.AppendAllTextAsync(_logPath, json + Environment.NewLine);
        }
        finally
        {
            _writeLock.Release();
        }
    }
}
