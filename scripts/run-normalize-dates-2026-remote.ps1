param(
    [string]$Server = "10.10.30.30,1433",
    [string]$Database = "MarriageCrm",
    [string]$SqlPath = (Join-Path $PSScriptRoot "..\database\normalize-dates-to-2026.sql"),
    [string]$User = "sa"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $SqlPath)) {
    throw "SQL file was not found: $SqlPath"
}

$securePassword = Read-Host "MSSQL administrator password" -AsSecureString
$passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)

try {
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
    $connectionString = "Server=$Server;Database=$Database;User ID=$User;Password=$plainPassword;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30"

    $sql = [System.IO.File]::ReadAllText(
        (Resolve-Path -LiteralPath $SqlPath).Path,
        [System.Text.Encoding]::UTF8)

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
                    -Activity "Normalizing CRM scenario dates to June 2026" `
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

        Write-Progress -Activity "Normalizing CRM scenario dates to June 2026" -Completed

        $summarySql = @"
SELECT N'dbo.customers.created_at' AS date_field, MIN(created_at) AS min_value, MAX(created_at) AS max_value, COUNT(*) AS row_count FROM dbo.customers
UNION ALL SELECT N'dbo.consulting_notes.consulted_at', MIN(consulted_at), MAX(consulted_at), COUNT(*) FROM dbo.consulting_notes
UNION ALL SELECT N'dbo.contracts.contract_date', CONVERT(datetime2(0), MIN(contract_date)), CONVERT(datetime2(0), MAX(contract_date)), COUNT(*) FROM dbo.contracts
UNION ALL SELECT N'dbo.matching_history.matched_at', CONVERT(datetime2(0), MIN(matched_at)), CONVERT(datetime2(0), MAX(matched_at)), COUNT(*) FROM dbo.matching_history
UNION ALL SELECT N'dbo.uploaded_files.uploaded_at', MIN(uploaded_at), MAX(uploaded_at), COUNT(*) FROM dbo.uploaded_files
UNION ALL SELECT N'dbo.app_users.created_at', MIN(created_at), MAX(created_at), COUNT(*) FROM dbo.app_users;
"@

        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($summarySql, $connection)
        $table = New-Object System.Data.DataTable
        [void]$adapter.Fill($table)

        Write-Host "Date normalization completed."
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
