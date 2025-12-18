# Deploy Website to GitHub /docs folder
# Automatically extract ZIP and upload to GitHub
# Usage: .\deploy-website-to-docs.ps1 -ZipPath "path\to\website.zip"

param(
    [Parameter(Mandatory=$false)]
    [string]$ZipPath = "",
    
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Add website to docs folder"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Deploy Website to GitHub /docs" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# If no ZIP path provided, ask user
if ($ZipPath -eq "" -or !(Test-Path $ZipPath)) {
    Write-Host "Enter path to website ZIP file:" -ForegroundColor Yellow
    $ZipPath = Read-Host "ZIP Path"
    
    if (!(Test-Path $ZipPath)) {
        Write-Host "✗ Error: ZIP file not found: $ZipPath" -ForegroundColor Red
        exit 1
    }
}

Write-Host "✓ Found ZIP: $ZipPath" -ForegroundColor Green
Write-Host ""

# Create temp extraction folder
$tempFolder = "temp-website-extract"
if (Test-Path $tempFolder) {
    Write-Host "Cleaning up old temp folder..." -ForegroundColor Gray
    Remove-Item -Recurse -Force $tempFolder
}

Write-Host "Extracting ZIP file..." -ForegroundColor Cyan
try {
    Expand-Archive -Path $ZipPath -DestinationPath $tempFolder -Force
    Write-Host "✓ ZIP extracted successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Error extracting ZIP: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Check structure - find index.html
Write-Host "Checking website structure..." -ForegroundColor Cyan

$indexPath = Get-ChildItem -Path $tempFolder -Filter "index.html" -Recurse | Select-Object -First 1

if (!$indexPath) {
    Write-Host "✗ Error: index.html not found in ZIP!" -ForegroundColor Red
    Write-Host "ZIP contents:" -ForegroundColor Yellow
    Get-ChildItem $tempFolder -Recurse | Select-Object FullName
    Remove-Item -Recurse -Force $tempFolder
    exit 1
}

$websiteRoot = $indexPath.DirectoryName
Write-Host "✓ Found index.html at: $websiteRoot" -ForegroundColor Green
Write-Host ""

# Backup existing docs folder if exists
if (Test-Path "docs") {
    $backupFolder = "docs-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Write-Host "Backing up existing docs folder to: $backupFolder" -ForegroundColor Yellow
    Move-Item "docs" $backupFolder
}

# Create docs folder
Write-Host "Creating docs folder..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path "docs" -Force | Out-Null

# Copy website files to docs
Write-Host "Copying website files to docs/..." -ForegroundColor Cyan
Copy-Item -Path "$websiteRoot\*" -Destination "docs\" -Recurse -Force

# Cleanup temp folder
Remove-Item -Recurse -Force $tempFolder
Write-Host "✓ Files copied successfully" -ForegroundColor Green
Write-Host ""

# Show docs structure
Write-Host "Website structure in docs/:" -ForegroundColor Cyan
Get-ChildItem "docs" | ForEach-Object {
    if ($_.PSIsContainer) {
        Write-Host "  📁 $($_.Name)/" -ForegroundColor Blue
    } else {
        Write-Host "  📄 $($_.Name)" -ForegroundColor Gray
    }
}
Write-Host ""

# Check if git is initialized
if (!(Test-Path ".git")) {
    Write-Host "✗ Error: Git repository not initialized!" -ForegroundColor Red
    Write-Host "Run: git init" -ForegroundColor Yellow
    exit 1
}

# Git operations
Write-Host "Uploading to GitHub..." -ForegroundColor Cyan
Write-Host ""

# Add files
Write-Host "→ git add docs/" -ForegroundColor Gray
git add docs/

# Check if there are changes
$status = git status --porcelain
if (!$status) {
    Write-Host "✓ No changes to commit (files already up to date)" -ForegroundColor Green
    exit 0
}

# Commit
Write-Host "→ git commit -m `"$CommitMessage`"" -ForegroundColor Gray
git commit -m $CommitMessage

# Push
Write-Host "→ git push" -ForegroundColor Gray
$pushResult = git push 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ Deployment Successful!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Go to GitHub repository Settings" -ForegroundColor White
    Write-Host "2. Navigate to Pages section" -ForegroundColor White
    Write-Host "3. Set Source to: main branch → /docs folder" -ForegroundColor White
    Write-Host "4. Save and wait 1-2 minutes" -ForegroundColor White
    Write-Host ""
    Write-Host "Your website will be live at:" -ForegroundColor Yellow
    Write-Host "https://YOUR_USERNAME.github.io/YOUR_REPO/" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ Error pushing to GitHub:" -ForegroundColor Red
    Write-Host $pushResult -ForegroundColor Red
    Write-Host ""
    Write-Host "Possible solutions:" -ForegroundColor Yellow
    Write-Host "1. Check if you're logged in: git config user.name" -ForegroundColor White
    Write-Host "2. Check remote: git remote -v" -ForegroundColor White
    Write-Host "3. Try: git push origin main" -ForegroundColor White
    exit 1
}
