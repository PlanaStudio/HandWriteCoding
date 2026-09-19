$ErrorActionPreference = "Stop"

Write-Host "Compiling extension..." -ForegroundColor Cyan
npm run compile

Write-Host "Packaging extension..." -ForegroundColor Cyan
npx @vscode/vsce package --no-git-tag-version --allow-missing-repository

# Get the generated vsix file name (assuming version is 0.1.0, or we can find it)
$vsixFile = Get-ChildItem -Filter "*.vsix" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $vsixFile) {
    Write-Error "Could not find packaged .vsix file."
    exit 1
}

Write-Host "Found package: $($vsixFile.Name)" -ForegroundColor Green

# Install in VS Code
if (Get-Command "code" -ErrorAction SilentlyContinue) {
    Write-Host "Installing to VS Code..." -ForegroundColor Cyan
    code --install-extension $vsixFile.FullName --force
} else {
    Write-Host "VS Code ('code' command) not found. Skipping VS Code install." -ForegroundColor Yellow
}

# Install in Antigravity IDE
if (Get-Command "antigravity-ide" -ErrorAction SilentlyContinue) {
    Write-Host "Installing to Antigravity IDE..." -ForegroundColor Cyan
    antigravity-ide --install-extension $vsixFile.FullName --force
} else {
    Write-Host "Antigravity IDE ('antigravity-ide' command) not found. Skipping Antigravity install." -ForegroundColor Yellow
}

Write-Host "Build and installation complete!" -ForegroundColor Green
