param(
    [string]$OutputPath = (Join-Path $PSScriptRoot "..\dummy-upload-data"),
    [string]$SqlOutputPath = (Join-Path $PSScriptRoot "..\database\insert-all-dummy-uploaded-files.sql"),
    [int]$FileCount = 600,
    [int]$StartIndex = 1,
    [string]$UploadedBy = "counselor",
    [string]$ClientIp = "10.10.20.15"
)

$ErrorActionPreference = "Stop"

# Usage:
# powershell -ExecutionPolicy Bypass -File .\scripts\generate-dummy-upload-data.ps1
#
# This single script creates realistic dummy upload files and rebuilds the
# consolidated SQL file for dbo.uploaded_files.

function New-DirectoryIfMissing {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function New-BinaryFile {
    param(
        [string]$Path,
        [long]$SizeBytes
    )

    $bufferSize = 1024 * 1024
    $buffer = New-Object byte[] $bufferSize
    $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    $stream = [System.IO.File]::Open($Path, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)

    try {
        $remaining = $SizeBytes
        while ($remaining -gt 0) {
            $writeSize = [Math]::Min($bufferSize, $remaining)
            $rng.GetBytes($buffer)
            $stream.Write($buffer, 0, $writeSize)
            $remaining -= $writeSize
        }
    }
    finally {
        $stream.Dispose()
        $rng.Dispose()
    }
}

function New-TextLikeFile {
    param(
        [string]$Path,
        [long]$SizeBytes,
        [string]$Kind,
        [int]$Index
    )

    $header = @(
        "YEONSU CRM INTERNAL MATERIAL",
        "batch=realistic-dummy",
        "document_index=$Index",
        "kind=$Kind",
        "created_at=$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss'))",
        ""
    ) -join [Environment]::NewLine

    switch ($Kind) {
        "csv" {
            $row = "customer_no,customer_name,category,status,score,updated_by,updated_at" + [Environment]::NewLine
            $body = "100001,Sample Customer,consulting,review,87,counselor,$((Get-Date).ToString('yyyy-MM-dd'))" + [Environment]::NewLine
            $template = $header + $row + ($body * 40)
        }
        "log" {
            $line = "[INFO] upload validation completed path=C:\crm-data\uploads result=success user=counselor" + [Environment]::NewLine
            $template = $header + ($line * 80)
        }
        default {
            $line = "Consulting note: customer profile, matching preference, interview summary, and follow-up task record." + [Environment]::NewLine
            $template = $header + ($line * 60)
        }
    }

    $encoding = New-Object System.Text.UTF8Encoding $false
    $bytes = $encoding.GetBytes($template)
    $stream = [System.IO.File]::Open($Path, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)

    try {
        $remaining = $SizeBytes
        while ($remaining -gt 0) {
            $writeSize = [Math]::Min($bytes.Length, $remaining)
            $stream.Write($bytes, 0, $writeSize)
            $remaining -= $writeSize
        }
    }
    finally {
        $stream.Dispose()
    }
}

function ConvertTo-SqlString {
    param([AllowNull()][string]$Value)
    if ($null -eq $Value) {
        return "NULL"
    }

    return "N'$($Value.Replace("'", "''"))'"
}

function Get-MimeType {
    param([string]$Extension)
    switch ($Extension.ToLowerInvariant()) {
        ".docx" { "application/vnd.openxmlformats-officedocument.wordprocessingml.document" }
        ".jpg" { "image/jpeg" }
        ".jpeg" { "image/jpeg" }
        ".pdf" { "application/pdf" }
        ".csv" { "text/csv" }
        ".log" { "text/plain" }
        ".txt" { "text/plain" }
        ".zip" { "application/zip" }
        default { "application/octet-stream" }
    }
}

function Get-UploadCategory {
    param([System.IO.FileInfo]$File)

    $name = $File.Name.ToLowerInvariant()
    if ($name -match "contract|agreement|pdf") {
        return "contract"
    }
    if ($name -match "photo|profile|application|docx") {
        return "customer_document"
    }

    return "consulting_material"
}

New-DirectoryIfMissing -Path $OutputPath
New-DirectoryIfMissing -Path (Split-Path -Parent $SqlOutputPath)

$random = New-Object System.Random 20260611
$profiles = @(
    @{ Prefix = "application_form"; Extension = ".docx"; Kind = "binary"; Min = 80KB; Max = 2MB },
    @{ Prefix = "profile_photo"; Extension = ".jpg"; Kind = "binary"; Min = 250KB; Max = 6MB },
    @{ Prefix = "consulting_note"; Extension = ".txt"; Kind = "text"; Min = 8KB; Max = 512KB },
    @{ Prefix = "matching_export"; Extension = ".csv"; Kind = "csv"; Min = 16KB; Max = 1MB },
    @{ Prefix = "contract_scan"; Extension = ".pdf"; Kind = "binary"; Min = 512KB; Max = 10MB },
    @{ Prefix = "archive_package"; Extension = ".zip"; Kind = "binary"; Min = 3MB; Max = 18MB },
    @{ Prefix = "system_review_log"; Extension = ".log"; Kind = "log"; Min = 8KB; Max = 768KB },
    @{ Prefix = "evidence_blob"; Extension = ".bin"; Kind = "binary"; Min = 1MB; Max = 12MB }
)

$endIndex = $StartIndex + $FileCount - 1
for ($i = $StartIndex; $i -le $endIndex; $i++) {
    $profile = $profiles[($i - 1) % $profiles.Count]
    $size = [long]$random.Next([int]$profile.Min, [int]$profile.Max)
    $name = "realistic_batch_{0}_{1:0000}{2}" -f $profile.Prefix, $i, $profile.Extension
    $path = Join-Path $OutputPath $name

    if (Test-Path -LiteralPath $path) {
        continue
    }

    if ($profile.Kind -eq "binary") {
        New-BinaryFile -Path $path -SizeBytes $size
    }
    else {
        New-TextLikeFile -Path $path -SizeBytes $size -Kind $profile.Kind -Index $i
    }
}

$files = Get-ChildItem -LiteralPath $OutputPath -File |
    Where-Object { $_.Name -notlike "*manifest.csv" } |
    Sort-Object Name

$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("SET NOCOUNT ON;")
$lines.Add("BEGIN TRANSACTION;")
$lines.Add("")
$lines.Add("DECLARE @now DATETIME2(0) = SYSUTCDATETIME();")
$lines.Add("")

$offset = 0
foreach ($file in $files) {
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash.ToLowerInvariant()
    $mime = Get-MimeType -Extension $file.Extension
    $category = Get-UploadCategory -File $file
    $originalName = $file.Name
    $storedName = $file.Name

    $lines.Add("IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = $(ConvertTo-SqlString $storedName))")
    $lines.Add("BEGIN")
    $lines.Add("    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)")
    $lines.Add("    VALUES ($(ConvertTo-SqlString $originalName), $(ConvertTo-SqlString $storedName), $(ConvertTo-SqlString $mime), $($file.Length), '$hash', $(ConvertTo-SqlString $category), $(ConvertTo-SqlString $UploadedBy), $(ConvertTo-SqlString $ClientIp), DATEADD(MINUTE, -$offset, @now));")
    $lines.Add("END")
    $lines.Add("")
    $offset++
}

$lines.Add("COMMIT TRANSACTION;")
$lines.Add("")

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines((Resolve-Path -LiteralPath (Split-Path -Parent $SqlOutputPath)).Path + "\" + (Split-Path -Leaf $SqlOutputPath), $lines, $utf8NoBom)

$totalBytes = ($files | Measure-Object -Property Length -Sum).Sum
$summary = [PSCustomObject]@{
    FileCount = $files.Count
    TotalGB = [Math]::Round($totalBytes / 1GB, 2)
    SqlOutputPath = (Resolve-Path -LiteralPath $SqlOutputPath).Path
    OutputPath = (Resolve-Path -LiteralPath $OutputPath).Path
}

$summary
