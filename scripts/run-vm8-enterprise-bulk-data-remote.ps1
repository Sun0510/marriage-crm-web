param(
    [string]$Server = "10.10.30.30,1433",
    [string]$Database = "MarriageCrm",
    [string]$SqlPath = (Join-Path $PSScriptRoot "..\database\vm8-enterprise-bulk-data.sql"),
    [string]$User = "sa",
    [ValidateRange(1, 100)]
    [int]$TargetGb = 10,
    [switch]$Append,
    [switch]$KeepRecoveryModel
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $SqlPath)) {
    throw "SQL file was not found: $SqlPath"
}

if ($User -eq "crm_app") {
    throw "crm_app does not have enough permission to create large company schemas. Use sa."
}

$securePassword = Read-Host "MSSQL administrator password" -AsSecureString
$passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)

try {
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
    $connectionString = "Server=$Server;Database=$Database;User ID=$User;Password=$plainPassword;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30"

    $sql = [System.IO.File]::ReadAllText(
        (Resolve-Path -LiteralPath $SqlPath).Path,
        [System.Text.Encoding]::UTF8)

    $resetExisting = if ($Append) { "0" } else { "1" }
    $setSimpleRecovery = if ($KeepRecoveryModel) { "0" } else { "1" }

    $sql = $sql.Replace("__TARGET_GB__", [string]$TargetGb)
    $sql = $sql.Replace("__RESET_EXISTING__", $resetExisting)
    $sql = $sql.Replace("__SET_SIMPLE_RECOVERY__", $setSimpleRecovery)

    if ($sql -match '__(TARGET_GB|RESET_EXISTING|SET_SIMPLE_RECOVERY)__') {
        throw "SQL template placeholders were not replaced. Check that run-vm8-enterprise-bulk-data-remote.ps1 and vm8-enterprise-bulk-data.sql are the latest matching files."
    }

    $batches = @(
        [regex]::Split($sql, '(?im)^\s*GO\s*(?:--.*)?$') |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )

    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()

    try {
        for ($index = 0; $index -lt $batches.Count; $index++) {
            $command = $connection.CreateCommand()
            $command.CommandTimeout = 0
            $command.CommandText = $batches[$index]

            try {
                [void]$command.ExecuteNonQuery()
                Write-Progress `
                    -Activity "Generating VM8 enterprise dummy data" `
                    -Status "Batch $($index + 1) of $($batches.Count)" `
                    -PercentComplete ((($index + 1) / $batches.Count) * 100)
            }
            catch {
                $preview = (($batches[$index] -split "`r?`n") |
                    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
                    Select-Object -First 3) -join " "
                throw "SQL batch $($index + 1) failed. Start: $preview`r`n$($_.Exception.Message)"
            }
            finally {
                $command.Dispose()
            }
        }

        Write-Progress -Activity "Generating VM8 enterprise dummy data" -Completed

        $summarySql = @"
SELECT
    s.name AS schema_name,
    t.name AS table_name,
    SUM(CASE WHEN p.index_id IN (0, 1) THEN p.row_count ELSE 0 END) AS row_count,
    CONVERT(decimal(18,2), SUM(p.reserved_page_count) * 8.0 / 1024.0 / 1024.0) AS reserved_gb
FROM sys.dm_db_partition_stats p
JOIN sys.tables t ON p.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name IN (N'company_ops', N'company_archive', N'company_security', N'company_finance')
GROUP BY s.name, t.name
ORDER BY reserved_gb DESC, schema_name, table_name;
"@
        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($summarySql, $connection)
        $table = New-Object System.Data.DataTable
        [void]$adapter.Fill($table)

        Write-Host "VM8 enterprise dummy data generation completed."
        Write-Host "Target GB: $TargetGb"
        $table | Format-Table -AutoSize
    }
    finally {
        $connection.Close()
        $connection.Dispose()
    }
}
finally {
    if ($passwordPointer -ne [IntPtr]::Zero) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($passwordPointer)
    }

    $plainPassword = $null
}
