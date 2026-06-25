# Ensure script stops on error
$ErrorActionPreference = 'Stop'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "🟩 Installing git"
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "🟩 Chocolatey is not installed. Installing Git using winget."
        winget install --id Git.Git -e --source winget
    } else {
        choco install git -y
    }
}

$FLUTTER_DIR = $env:RUNNER_TEMP
if (Test-Path "$FLUTTER_DIR\flutter") {
   Write-Host "🟩 Removing flutter directory"
   Remove-Item -Recurse -Force "$FLUTTER_DIR\flutter"
}

Write-Host "🟩 Cloning the Flutter repository"
New-Item -ItemType Directory -Force -Path "$FLUTTER_DIR\flutter" | Out-Null
git clone --depth 1 -b 3.44.4 https://github.com/flutter/flutter.git "$FLUTTER_DIR\flutter"

Write-Host "🟩 Config $FLUTTER_DIR\flutter"
Set-Location -Path "$FLUTTER_DIR\flutter"
git config --local safe.directory "$FLUTTER_DIR\flutter"

$envFile = $env:GITHUB_ENV
if ($envFile) {
    Add-Content -Path $envFile -Value "FLUTTER_ROOT=$FLUTTER_DIR\flutter"
    Add-Content -Path $envFile -Value "PUB_CACHE=$env:USERPROFILE\.pub-cache"
}

$pathFile = $env:GITHUB_PATH
if ($pathFile) {
    Add-Content -Path $pathFile -Value "$FLUTTER_DIR\flutter\bin"
    Add-Content -Path $pathFile -Value "$FLUTTER_DIR\flutter\bin\cache\dart-sdk\bin"
    Add-Content -Path $pathFile -Value "$env:USERPROFILE\.pub-cache\bin"
}
