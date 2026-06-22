param(
    [string]$Server = "10.10.30.30,1433",
    [string]$Database = "MarriageCrm",
    [string]$User = "sa",
    [string]$RootPath = "C:\crm-data\uploads",
    [long]$MaxFileSizeBytes = 209715200,
    [switch]$Overwrite
)

$ErrorActionPreference = "Stop"

$blockedExtensions = @(
    ".aspx", ".ashx", ".asmx", ".php", ".jsp",
    ".ps1", ".bat", ".cmd", ".vbs", ".js",
    ".exe", ".dll", ".com", ".scr"
)

if (-not (Test-Path -LiteralPath $RootPath)) {
    New-Item -ItemType Directory -Path $RootPath -Force | Out-Null
}

$securePassword = Read-Host "MSSQL password" -AsSecureString
$plainPassword = [Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
)

$connectionString = "Server=$Server;Database=$Database;User ID=$User;Password=$plainPassword;Encrypt=True;TrustServerCertificate=True"

$query = @"
SELECT
    id,
    uploaded_at,
    original_name,
    stored_name,
    mime_type,
    size_bytes,
    sha256,
    category
FROM dbo.uploaded_files
ORDER BY uploaded_at, id;
"@

$connection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
$command = $connection.CreateCommand()
$command.CommandText = $query
$command.CommandTimeout = 0

$table = New-Object System.Data.DataTable
$adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
$null = $adapter.Fill($table)
$connection.Close()

$created = 0
$updated = 0
$skipped = 0

foreach ($row in $table.Rows) {
    $storedName = [string]$row.stored_name
    if ([string]::IsNullOrWhiteSpace($storedName)) {
        $storedName = [string]$row.original_name
    }

    $safeName = [System.IO.Path]::GetFileName($storedName)
    if ([string]::IsNullOrWhiteSpace($safeName)) {
        Write-Warning "Skip upload id=$($row.id): empty file name."
        $skipped++
        continue
    }

    $extension = [System.IO.Path]::GetExtension($safeName).ToLowerInvariant()
    if ($blockedExtensions -contains $extension) {
        Write-Warning "Skip upload id=$($row.id): blocked executable extension '$extension' ($safeName)."
        $skipped++
        continue
    }

    $size = [long]$row.size_bytes
    if ($size -lt 0) {
        Write-Warning "Skip upload id=$($row.id): invalid size $size."
        $skipped++
        continue
    }

    if ($size -gt $MaxFileSizeBytes) {
        Write-Warning "Skip upload id=$($row.id): size $size exceeds MaxFileSizeBytes $MaxFileSizeBytes."
        $skipped++
        continue
    }

    $targetPath = Join-Path $RootPath $safeName
    $uploadedAt = [DateTime]$row.uploaded_at

    if ((Test-Path -LiteralPath $targetPath) -and -not $Overwrite) {
        [System.IO.File]::SetCreationTime($targetPath, $uploadedAt)
        [System.IO.File]::SetLastWriteTime($targetPath, $uploadedAt)
        [System.IO.File]::SetLastAccessTime($targetPath, $uploadedAt)
        $updated++
        continue
    }

    $header = @"
Yeonsu CRM uploaded file placeholder
UploadId: $($row.id)
OriginalName: $($row.original_name)
StoredName: $safeName
Category: $($row.category)
MimeType: $($row.mime_type)
DbSizeBytes: $size
DbSha256: $($row.sha256)
UploadedAt: $uploadedAt

This lab file was generated from dbo.uploaded_files metadata so that VM5 storage matches the DB record.
"@

    $encoding = New-Object System.Text.UTF8Encoding($false)
    $headerBytes = $encoding.GetBytes($header)

    $stream = [System.IO.File]::Open($targetPath, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)
    try {
        if ($size -gt 0) {
            $bytesToWrite = [Math]::Min([long]$headerBytes.Length, $size)
            $stream.Write($headerBytes, 0, [int]$bytesToWrite)
        }
        $stream.SetLength($size)
    }
    finally {
        $stream.Close()
    }

    [System.IO.File]::SetCreationTime($targetPath, $uploadedAt)
    [System.IO.File]::SetLastWriteTime($targetPath, $uploadedAt)
    [System.IO.File]::SetLastAccessTime($targetPath, $uploadedAt)
    $created++
}

Write-Host "Upload file sync completed."
Write-Host "RootPath : $RootPath"
Write-Host "Created  : $created"
Write-Host "Updated  : $updated"
Write-Host "Skipped  : $skipped"
Write-Host ""
Write-Host "Note: file names, sizes, and timestamps are matched to DB metadata."
Write-Host "      SHA-256 values cannot be reproduced unless the original file bytes already exist."
