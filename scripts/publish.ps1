param(
    [string]$Configuration = "Release",
    [string]$OutputPath = (Join-Path $PSScriptRoot "..\publish")
)

$ErrorActionPreference = "Stop"
$projectPath = Join-Path $PSScriptRoot "..\MarriageCrm.csproj"

if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
    throw ".NET SDK was not found. Install the .NET 10 SDK before publishing."
}

$sdkList = dotnet --list-sdks
if (-not $sdkList) {
    throw ".NET SDK was not found. Install the .NET 10 SDK before publishing."
}

dotnet publish $projectPath `
    --configuration $Configuration `
    --output $OutputPath `
    --runtime win-x64 `
    --self-contained false
