param(
    [string]$ContainerName = "marriage-crm-sql",
    [string]$SaPassword = "LabOnly-SA-2026!",
    [string]$AppPassword = "LabOnly-App-2026!",
    [switch]$ResetDatabase
)

$ErrorActionPreference = "Stop"
$projectPath = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$initSqlPath = Join-Path $projectPath "database\init.sql"
$customerResetSqlPath = Join-Path $projectPath "database\customer-data-reset.sql"
$developmentSettingsPath = Join-Path $projectPath "appsettings.Development.json"
$image = "mcr.microsoft.com/mssql/server:2022-latest"

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw "Docker CLI was not found. Install and start Docker Desktop first."
}

docker info | Out-Null
if ($LASTEXITCODE -ne 0) {
    throw "Docker Desktop is not running. Start Docker Desktop and retry."
}

$containerExists = docker ps -a --filter "name=^/$ContainerName$" --format "{{.Names}}"
if (-not $containerExists) {
    docker pull $image
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to pull the SQL Server container image."
    }

    docker run `
        --name $ContainerName `
        --hostname $ContainerName `
        -e "ACCEPT_EULA=Y" `
        -e "MSSQL_SA_PASSWORD=$SaPassword" `
        -p "1433:1433" `
        -d `
        $image | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to start the SQL Server container."
    }
}
else {
    docker start $ContainerName | Out-Null
}

$sqlcmd = "/opt/mssql-tools18/bin/sqlcmd"
$ready = $false
for ($attempt = 1; $attempt -le 45; $attempt++) {
    docker exec $ContainerName $sqlcmd -No -S localhost -U sa -P $SaPassword -Q "SELECT 1" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        $ready = $true
        break
    }
    Start-Sleep -Seconds 2
}

if (-not $ready) {
    throw "SQL Server did not become ready. Check: docker logs $ContainerName"
}

$databaseState = docker exec $ContainerName $sqlcmd -No -h -1 -W -S localhost -U sa -P $SaPassword -Q "SET NOCOUNT ON; IF DB_ID(N'MarriageCrm') IS NULL SELECT 'MISSING' ELSE SELECT 'EXISTS';"
if ($databaseState -match "EXISTS" -and -not $ResetDatabase) {
    throw "MarriageCrm already exists. Re-run with -ResetDatabase only if you want to recreate the local training data."
}

$temporarySqlPath = Join-Path ([System.IO.Path]::GetTempPath()) "marriage-crm-init.sql"
try {
    $initSql = (Get-Content -Raw -Encoding UTF8 -LiteralPath $initSqlPath).Replace("CHANGE_ME_CRM_APP_PASSWORD", $AppPassword.Replace("'", "''"))
    $customerResetSql = Get-Content -Raw -Encoding UTF8 -LiteralPath $customerResetSqlPath
    $sql = "$initSql`r`nGO`r`n$customerResetSql"
    Set-Content -LiteralPath $temporarySqlPath -Value $sql -Encoding utf8
    docker cp $temporarySqlPath "${ContainerName}:/tmp/marriage-crm-init.sql"
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to copy the database initialization script."
    }

    docker exec $ContainerName $sqlcmd -No -b -S localhost -U sa -P $SaPassword -i "/tmp/marriage-crm-init.sql"
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to initialize the MarriageCrm database."
    }
}
finally {
    Remove-Item -LiteralPath $temporarySqlPath -Force -ErrorAction SilentlyContinue
}

$customerCount = docker exec $ContainerName $sqlcmd -No -h -1 -W -S localhost -U sa -P $SaPassword -d MarriageCrm -Q "SET NOCOUNT ON; SELECT COUNT(*) FROM dbo.customers;"
if ($LASTEXITCODE -ne 0 -or [int]$customerCount -lt 1) {
    throw "Database initialization completed without customer seed data."
}

$settings = @{
    ConnectionStrings = @{
        CrmDatabase = "Server=localhost,1433;Database=MarriageCrm;User ID=crm_app;Password=$AppPassword;Encrypt=False"
    }
    Storage = @{
        UploadPath = "local-data\uploads"
        AuditLogPath = "local-data\logs\crm-audit.jsonl"
    }
}

$settings | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $developmentSettingsPath -Encoding utf8

Write-Host "Local database is ready."
Write-Host "Development settings: $developmentSettingsPath"
Write-Host "CRM counselor login: kim.hana / Hana.Kim@CRM26!"
Write-Host "CRM admin login: admin / LabOnly-Admin-2026!"
