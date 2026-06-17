param(
    [string]$RootPath = (Join-Path $PSScriptRoot "..\dummy-upload-data"),
    [string]$SqlPath = (Join-Path $PSScriptRoot "..\database\yeonsu-crm-all-in-one.sql"),
    [datetime]$ScenarioStart = [datetime]"2020-02-03T00:00:00",
    [datetime]$ScenarioEnd = [datetime]"2022-05-29T23:59:59",
    [string[]]$ExcludedDatabaseExtensions = @(".log", ".bin"),
    [switch]$SkipSqlUpdate
)

$ErrorActionPreference = "Stop"

function Get-DeterministicBytes {
    param([Parameter(Mandatory = $true)][string]$Value)

    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    try {
        return $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Value))
    }
    finally {
        $sha256.Dispose()
    }
}

function Get-FileDate {
    param(
        [Parameter(Mandatory = $true)][System.IO.FileInfo]$File,
        [Parameter(Mandatory = $true)][byte[]]$Seed
    )

    if ($File.BaseName -match '(?<!\d)(20\d{6})(?!\d)') {
        return [datetime]::ParseExact(
            $Matches[1],
            "yyyyMMdd",
            [System.Globalization.CultureInfo]::InvariantCulture)
    }

    if ($File.BaseName -match '(?<!\d)(20\d{4})(?!\d)') {
        $month = [datetime]::ParseExact(
            $Matches[1],
            "yyyyMM",
            [System.Globalization.CultureInfo]::InvariantCulture)
        $daysInMonth = [datetime]::DaysInMonth($month.Year, $month.Month)
        $day = 1 + (($Seed[4] + (256 * $Seed[5])) % $daysInMonth)
        return [datetime]::new($month.Year, $month.Month, $day)
    }

    throw "No YYYYMMDD or YYYYMM date was found in the file name: $($File.Name)"
}

function Get-UploadTime {
    param(
        [Parameter(Mandatory = $true)][datetime]$Date,
        [Parameter(Mandatory = $true)][byte[]]$Seed
    )

    $bucket = $Seed[0] % 100
    $minuteSeed = $Seed[1] + (256 * $Seed[2])

    if ($bucket -lt 68) {
        # Most records look like ordinary office-hour activity.
        $minuteOfDay = (8 * 60 + 20) + ($minuteSeed % 611)
    }
    elseif ($bucket -lt 84) {
        $minuteOfDay = (18 * 60 + 31) + ($minuteSeed % 239)
    }
    elseif ($bucket -lt 92) {
        $minuteOfDay = (6 * 60) + ($minuteSeed % 140)
    }
    elseif ($bucket -lt 97) {
        $minuteOfDay = (22 * 60 + 30) + ($minuteSeed % 90)
    }
    else {
        $minuteOfDay = $minuteSeed % 360
    }

    return $Date.Date.AddMinutes($minuteOfDay).AddSeconds($Seed[3] % 60)
}

$resolvedRoot = (Resolve-Path -LiteralPath $RootPath).Path
$files = @(Get-ChildItem -LiteralPath $resolvedRoot -File -Recurse)
$excludedExtensions = @($ExcludedDatabaseExtensions | ForEach-Object { $_.ToLowerInvariant() })
$databaseFiles = @($files | Where-Object { $excludedExtensions -notcontains $_.Extension.ToLowerInvariant() })

if ($files.Count -eq 0) {
    throw "No files were found under: $resolvedRoot"
}

$uploadTimes = @{}
$periodCounts = [ordered]@{
    EarlyMorning = 0
    OfficeHours = 0
    Evening = 0
    LateNight = 0
}

foreach ($file in $files) {
    $seed = Get-DeterministicBytes -Value $file.Name
    $fileDate = Get-FileDate -File $file -Seed $seed
    $uploadTime = Get-UploadTime -Date $fileDate -Seed $seed

    if ($uploadTime -lt $ScenarioStart) {
        $uploadTime = $ScenarioStart.AddMinutes(10 + ($seed[6] % 480)).AddSeconds($seed[7] % 60)
    }
    elseif ($uploadTime -gt $ScenarioEnd) {
        $uploadTime = $ScenarioEnd.AddMinutes(-1 * (10 + ($seed[6] % 480)))
    }

    $editLeadMinutes = 5 + (($seed[8] + (256 * $seed[9])) % 4320)
    $lastWriteTime = $uploadTime.AddMinutes(-$editLeadMinutes)
    if ($lastWriteTime -lt $ScenarioStart) {
        $lastWriteTime = $ScenarioStart.AddSeconds($seed[10] % 60)
    }

    $accessDelayMinutes = 10 + (($seed[11] + (256 * $seed[12])) % 10080)
    $lastAccessTime = $uploadTime.AddMinutes($accessDelayMinutes)
    if ($lastAccessTime -gt $ScenarioEnd) {
        $lastAccessTime = $ScenarioEnd.AddSeconds(-1 * ($seed[13] % 60))
    }

    [System.IO.File]::SetCreationTime($file.FullName, $uploadTime)
    [System.IO.File]::SetLastWriteTime($file.FullName, $lastWriteTime)
    [System.IO.File]::SetLastAccessTime($file.FullName, $lastAccessTime)
    $uploadTimes[$file.Name] = $uploadTime

    if ($uploadTime.Hour -lt 6 -or $uploadTime.Hour -ge 22) {
        $periodCounts.LateNight++
    }
    elseif ($uploadTime.Hour -lt 8) {
        $periodCounts.EarlyMorning++
    }
    elseif ($uploadTime.Hour -lt 19) {
        $periodCounts.OfficeHours++
    }
    else {
        $periodCounts.Evening++
    }
}

if (-not $SkipSqlUpdate) {
    $resolvedSql = (Resolve-Path -LiteralPath $SqlPath).Path
    $sql = [System.IO.File]::ReadAllText($resolvedSql, [System.Text.Encoding]::UTF8)
    $existingTimestamp = "(?:DATEADD\(MINUTE, -\d+, @uploadEnd\)|CONVERT\(datetime2\(0\), '\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}'\))"
    $pattern = "(?m)^(?<prefix>\s*VALUES \()$existingTimestamp(?<middle>, N'[^']*', N'[^']*', N'[^']*', N'(?<stored>[^']+)',.*)$"
    $updateState = @{ UpdatedRows = 0 }

    $sql = [regex]::Replace($sql, $pattern, {
        param($match)

        $storedName = $match.Groups['stored'].Value
        if (-not $uploadTimes.ContainsKey($storedName)) {
            throw "The SQL upload record has no matching file: $storedName"
        }

        $updateState.UpdatedRows++
        $timestamp = $uploadTimes[$storedName].ToString("yyyy-MM-ddTHH:mm:ss")
        return $match.Groups['prefix'].Value +
            "CONVERT(datetime2(0), '$timestamp')" +
            $match.Groups['middle'].Value
    })

    if ($updateState.UpdatedRows -ne $databaseFiles.Count) {
        throw "Updated SQL rows ($($updateState.UpdatedRows)) did not match database file count ($($databaseFiles.Count))."
    }

    [System.IO.File]::WriteAllText(
        $resolvedSql,
        $sql,
        (New-Object System.Text.UTF8Encoding($false)))
}

$earliest = ($uploadTimes.Values | Sort-Object | Select-Object -First 1)
$latest = ($uploadTimes.Values | Sort-Object -Descending | Select-Object -First 1)

Write-Host "Historical file times updated successfully."
Write-Host "Files: $($files.Count)"
Write-Host "Database upload records: $($databaseFiles.Count)"
Write-Host "Range: $($earliest.ToString('yyyy-MM-dd HH:mm:ss')) - $($latest.ToString('yyyy-MM-dd HH:mm:ss'))"
Write-Host "Office hours: $($periodCounts.OfficeHours)"
Write-Host "Early morning: $($periodCounts.EarlyMorning)"
Write-Host "Evening: $($periodCounts.Evening)"
Write-Host "Late night: $($periodCounts.LateNight)"
