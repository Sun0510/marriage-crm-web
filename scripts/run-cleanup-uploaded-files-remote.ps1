param(
    [string]$Server = "10.10.30.30,1433",
    [string]$Database = "MarriageCrm",
    [string]$SqlPath = (Join-Path $PSScriptRoot "..\database\cleanup-uploaded-files.sql"),
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

    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()

    try {
        $command = $connection.CreateCommand()
        $command.CommandTimeout = 0
        $command.CommandText = $sql

        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
        $dataSet = New-Object System.Data.DataSet
        [void]$adapter.Fill($dataSet)

        Write-Host "Upload cleanup completed."
        for ($i = 0; $i -lt $dataSet.Tables.Count; $i++) {
            Write-Host ""
            Write-Host "Result set $($i + 1)"
            $dataSet.Tables[$i] | Format-Table -AutoSize
        }
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
