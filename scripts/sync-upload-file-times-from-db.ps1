param(
    [string]$Server = "10.10.30.30,1433",
    [string]$Database = "MarriageCrm",
    [string]$User = "sa",
    [string]$RootPath = "C:\crm-data\uploads",
    [switch]$Recurse,
    [switch]$UseOriginalNameFallback,
    [switch]$SetLastWriteFiveMinutesBeforeUpload
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $RootPath)) {
    throw "RootPath was not found: $RootPath"
}

$securePassword = Read-Host "MSSQL password" -AsSecureString
$passwordPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)

try {
    $plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($passwordPointer)
    $connectionString = "Server=$Server;Database=$Database;User ID=$User;Password=$plainPassword;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30"

    $query = """
SELECT
    id,
    stored_name,
    original_name,
    uploaded_at
FROM dbo.uploaded_files
ORDER BY id;
"""

    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()

    try {
        $command = $connection.CreateCommand()
        $command.CommandText = $query
        $command.CommandTimeout = 0

        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
        $table = New-Object System.Data.DataTable
        [void]$adapter.Fill($table)
    }
    finally {
        $connection.Close()
        $connection.Dispose()
    }

    $uploadByStoredName = @{}
    $uploadByOriginalName = @{}

    foreach ($row in $table.Rows) {
        $storedName = [string]$row.stored_name
        $originalName = [string]$row.original_name
        $uploadedAt = [datetime]$row.uploaded_at

        if (-not [string]::IsNullOrWhiteSpace($storedName)) {
            $uploadByStoredName[$storedName] = $uploadedAt
        }

        if (-not [string]::IsNullOrWhiteSpace($originalName)) {
            $uploadByOriginalName[$originalName] = $uploadedAt
        }
    }

    $searchOption = if ($Recurse) { [System.IO.SearchOption]::AllDirectories } else { [System.IO.SearchOption]::TopDirectoryOnly }
    $files = [System.IO.Directory]::EnumerateFiles((Resolve-Path -LiteralPath $RootPath).Path, "*", $searchOption)

    $updated = New-Object System.Collections.Generic.List[object]
    $skipped = New-Object System.Collections.Generic.List[object]

    foreach ($filePath in $files) {
        $file = Get-Item -LiteralPath $filePath
        $uploadedAt = $null
        $matchedBy = $null

        if ($uploadByStoredName.ContainsKey($file.Name)) {
            $uploadedAt = $uploadByStoredName[$file.Name]
            $matchedBy = "stored_name"
        }
        elseif ($UseOriginalNameFallback -and $uploadByOriginalName.ContainsKey($file.Name)) {
            $uploadedAt = $uploadByOriginalName[$file.Name]
            $matchedBy = "original_name"
        }

        if ($null -eq $uploadedAt) {
            $skipped.Add([pscustomobject]@{
                Name = $file.Name
                Reason = "No matching uploaded_files row"
            })
            continue
        }

        $lastWriteTime = if ($SetLastWriteFiveMinutesBeforeUpload) {
            $uploadedAt.AddMinutes(-5)
        }
        else {
            $uploadedAt
        }

        [System.IO.File]::SetCreationTime($file.FullName, $uploadedAt)
        [System.IO.File]::SetLastWriteTime($file.FullName, $lastWriteTime)
        [System.IO.File]::SetLastAccessTime($file.FullName, $uploadedAt)

        $updated.Add([pscustomobject]@{
            Name = $file.Name
            MatchedBy = $matchedBy
            CreationTime = $uploadedAt
            LastWriteTime = $lastWriteTime
        })
    }

    Write-Host "Upload file timestamp sync completed."
    Write-Host "RootPath: $RootPath"
    Write-Host "DB upload records: $($table.Rows.Count)"
    Write-Host "Updated files: $($updated.Count)"
    Write-Host "Skipped files: $($skipped.Count)"

    if ($updated.Count -gt 0) {
        Write-Host ""
        Write-Host "Recently updated files"
        $updated |
            Sort-Object CreationTime -Descending |
            Select-Object -First 20 |
            Format-Table -AutoSize
    }

    if ($skipped.Count -gt 0) {
        Write-Host ""
        Write-Host "Skipped sample"
        $skipped |
            Select-Object -First 20 |
            Format-Table -AutoSize
    }
}
finally {
    if ($passwordPointer -ne [IntPtr]::Zero) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($passwordPointer)
    }

    $plainPassword = $null
}
