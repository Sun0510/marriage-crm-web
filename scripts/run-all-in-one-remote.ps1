param(
    [string]$Server = "10.10.30.30,1433",
    [string]$SqlPath = (Join-Path $PSScriptRoot "..\database\yeonsu-crm-all-in-one.sql"),
    [string]$User = "sa"
)

$ErrorActionPreference = "Stop"

function Split-LargeDataBatch {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Batch,
        [int]$RowsPerCommand = 250
    )

    if ($Batch.Length -lt 1MB) {
        return ,$Batch
    }

    $parts = New-Object 'System.Collections.Generic.List[string]'
    $builder = New-Object System.Text.StringBuilder
    $bulkRowCount = 0

    foreach ($line in [regex]::Split($Batch, "\r?\n")) {
        [void]$builder.AppendLine($line)

        # These generated INSERT statements each occupy one complete line.
        # Splitting after a complete statement keeps the active transaction
        # on this SQL connection while avoiding one very large compiled batch.
        if ($line -match '^\s*INSERT INTO dbo\.(customers|customer_portal_accounts|contracts|consulting_notes|matching_history)\b') {
            $bulkRowCount++

            if ($bulkRowCount -ge $RowsPerCommand) {
                $parts.Add($builder.ToString())
                [void]$builder.Clear()
                $bulkRowCount = 0
            }
        }
    }

    if ($builder.Length -gt 0) {
        $parts.Add($builder.ToString())
    }

    return $parts.ToArray()
}

if (-not (Test-Path -LiteralPath $SqlPath)) {
    throw "SQL file was not found: $SqlPath"
}

if ($User -eq "crm_app") {
    throw "crm_app cannot create databases, logins, or tables. Run this initialization with sa."
}

$securePassword = Read-Host "MSSQL administrator password" -AsSecureString
$passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)

try {
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
    $connectionString = "Server=$Server;Database=master;User ID=$User;Password=$plainPassword;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30"

    $sql = [System.IO.File]::ReadAllText(
        (Resolve-Path -LiteralPath $SqlPath).Path,
        [System.Text.Encoding]::UTF8)

    # GO is a client-side batch separator and must not be sent to SQL Server.
    $batches = @(
        [regex]::Split($sql, '(?im)^\s*GO\s*(?:--.*)?$') |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    )

    $executionUnits = New-Object 'System.Collections.Generic.List[string]'
    foreach ($batch in $batches) {
        foreach ($part in @(Split-LargeDataBatch -Batch $batch)) {
            if (-not [string]::IsNullOrWhiteSpace($part)) {
                $executionUnits.Add($part)
            }
        }
    }

    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()

    try {
        for ($index = 0; $index -lt $executionUnits.Count; $index++) {
            $command = $connection.CreateCommand()
            $command.CommandTimeout = 0
            $command.CommandText = $executionUnits[$index]

            try {
                [void]$command.ExecuteNonQuery()
                Write-Progress `
                    -Activity "Applying Yeonsu CRM database" `
                    -Status "Command $($index + 1) of $($executionUnits.Count)" `
                    -PercentComplete ((($index + 1) / $executionUnits.Count) * 100)
            }
            catch {
                $preview = (($executionUnits[$index] -split "`r?`n") |
                    Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
                    Select-Object -First 3) -join " "
                throw "SQL command $($index + 1) failed. Start: $preview`r`n$($_.Exception.Message)"
            }
            finally {
                $command.Dispose()
            }
        }

        Write-Progress -Activity "Applying Yeonsu CRM database" -Completed

        $verify = $connection.CreateCommand()
        $verify.CommandText = "SELECT COUNT(*) FROM MarriageCrm.dbo.customers;"
        $customerCount = [int]$verify.ExecuteScalar()
        $verify.Dispose()

        Write-Host "SQL execution completed successfully."
        Write-Host "Customer count: $customerCount"
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
