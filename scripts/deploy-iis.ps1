param(
    [string]$PublishPath = (Join-Path $PSScriptRoot "..\publish"),
    [string]$SitePath = "C:\inetpub\MarriageCrm",
    [string]$SiteName = "MarriageCrm",
    [string]$AppPoolName = "MarriageCrm",
    [int]$Port = 80
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $PublishPath)) {
    throw "Publish output was not found at $PublishPath. Run scripts\publish.ps1 first."
}

Install-WindowsFeature Web-Server, Web-Http-Logging, Web-Request-Monitor -IncludeManagementTools
Import-Module WebAdministration

New-Item -ItemType Directory -Force -Path $SitePath | Out-Null
$UploadPath = "C:\crm-data\uploads"
$CustomerDocumentPath = Join-Path $SitePath "customer-documents"
New-Item -ItemType Directory -Force -Path $UploadPath | Out-Null
New-Item -ItemType Directory -Force -Path $CustomerDocumentPath | Out-Null
New-Item -ItemType Directory -Force -Path "C:\crm-data\logs" | Out-Null

if (Test-Path "IIS:\Sites\$SiteName") {
    Stop-Website -Name $SiteName -ErrorAction SilentlyContinue
}

if (Test-Path "IIS:\AppPools\$AppPoolName") {
    Stop-WebAppPool -Name $AppPoolName -ErrorAction SilentlyContinue
}

$offlinePath = Join-Path $SitePath "app_offline.htm"
Set-Content -LiteralPath $offlinePath -Value "Marriage CRM is being updated." -Encoding UTF8
Start-Sleep -Seconds 3

try {
    $copySucceeded = $false
    for ($attempt = 1; $attempt -le 10; $attempt++) {
        try {
            Copy-Item -Path (Join-Path $PublishPath "*") -Destination $SitePath -Recurse -Force -ErrorAction Stop
            $copySucceeded = $true
            break
        }
        catch {
            if ($attempt -eq 10) {
                throw
            }

            Write-Host "Published files are still locked. Retrying copy in 2 seconds... ($attempt/10)"
            Start-Sleep -Seconds 2
        }
    }

    if (-not $copySucceeded) {
        throw "Failed to copy published files to $SitePath."
    }
}
finally {
    Remove-Item -LiteralPath $offlinePath -Force -ErrorAction SilentlyContinue
}

if (-not (Test-Path "IIS:\AppPools\$AppPoolName")) {
    New-WebAppPool -Name $AppPoolName | Out-Null
}
Set-ItemProperty "IIS:\AppPools\$AppPoolName" -Name processModel.identityType -Value ApplicationPoolIdentity

$bindingInformation = "*:${Port}:"
$conflictingSites = Get-Website | Where-Object {
    $_.Name -ne $SiteName -and
    ($_.Bindings.Collection | Where-Object { $_.bindingInformation -eq $bindingInformation })
}

foreach ($site in $conflictingSites) {
    if ($site.Name -eq "Default Web Site") {
        Stop-Website -Name $site.Name
    }
    else {
        throw "Port $Port is already bound by IIS site '$($site.Name)'. Stop it or choose another port."
    }
}

if (-not (Test-Path "IIS:\Sites\$SiteName")) {
    New-Website -Name $SiteName -PhysicalPath $SitePath -Port $Port -ApplicationPool $AppPoolName | Out-Null
}
else {
    Set-ItemProperty "IIS:\Sites\$SiteName" -Name physicalPath -Value $SitePath
    Set-ItemProperty "IIS:\Sites\$SiteName" -Name applicationPool -Value $AppPoolName

    $site = Get-Website -Name $SiteName
    $hasBinding = $site.Bindings.Collection | Where-Object { $_.bindingInformation -eq $bindingInformation }
    if (-not $hasBinding) {
        New-WebBinding -Name $SiteName -Protocol http -Port $Port -IPAddress "*" | Out-Null
    }
}

$appPoolIdentity = "IIS AppPool\$AppPoolName"
icacls $SitePath /grant "${appPoolIdentity}:(OI)(CI)(RX)" /T | Out-Null
icacls $UploadPath /grant "${appPoolIdentity}:(OI)(CI)(M)" /T | Out-Null
icacls $CustomerDocumentPath /grant "${appPoolIdentity}:(OI)(CI)(M)" /T | Out-Null
icacls "C:\crm-data\logs" /grant "${appPoolIdentity}:(OI)(CI)(M)" /T | Out-Null

if (-not (Get-NetFirewallRule -DisplayName "Marriage CRM HTTP" -ErrorAction SilentlyContinue)) {
    New-NetFirewallRule `
        -DisplayName "Marriage CRM HTTP" `
        -Direction Inbound `
        -Protocol TCP `
        -LocalPort $Port `
        -RemoteAddress "10.10.20.0/24" `
        -Action Allow | Out-Null
}

Start-WebAppPool -Name $AppPoolName
Start-Website -Name $SiteName

Write-Host "IIS deployment completed."
Write-Host "Create $SitePath\appsettings.Production.json before opening the CRM."
Write-Host "CRM URL: http://10.10.30.20:$Port/"
