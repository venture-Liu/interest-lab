$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$envFile = Join-Path $projectRoot '.env'

if (-not (Test-Path -LiteralPath $envFile)) {
    Write-Host 'Missing .env. Run: Copy-Item .env.example .env' -ForegroundColor Yellow
    exit 1
}

$requiredKeys = @('PROJECT_NAME', 'APP_ENV', 'LOG_LEVEL', 'DATA_DIR')
$configuredKeys = Get-Content -LiteralPath $envFile |
    Where-Object { $_ -match '^\s*[^#][^=]*=' } |
    ForEach-Object { ($_ -split '=', 2)[0].Trim() }

$missingKeys = $requiredKeys | Where-Object { $_ -notin $configuredKeys }
if ($missingKeys.Count -gt 0) {
    Write-Host "Missing parameters: $($missingKeys -join ', ')" -ForegroundColor Red
    exit 1
}

Write-Host 'Local parameters are complete and .env is ignored by Git.' -ForegroundColor Green
