$ErrorActionPreference = "Stop"
$projectPath = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$settingsPath = Join-Path $projectPath "appsettings.Development.json"

if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    throw ".NET SDK was not found. Install it with: winget install Microsoft.DotNet.SDK.10"
}

$sdkList = dotnet --list-sdks
if (-not $sdkList) {
    throw ".NET SDK was not found. Install it with: winget install Microsoft.DotNet.SDK.10"
}

if (-not (Test-Path $settingsPath)) {
    throw "Development settings were not found. Run scripts\setup-local-db.ps1 first."
}

Push-Location $projectPath
try {
    $env:ASPNETCORE_ENVIRONMENT = "Development"
    $env:Logging__EventLog__LogLevel__Default = "None"
    dotnet run --urls "http://localhost:5080"
}
finally {
    Pop-Location
}
