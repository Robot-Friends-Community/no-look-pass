# No-Look Pass — Install Script (Windows PowerShell)
# Usage: .\install.ps1

$claudeDir = if ($env:CLAUDE_DIR) { $env:CLAUDE_DIR } else { "$env:USERPROFILE\.claude" }
$skillDest = "$claudeDir\skills\no-look-pass"
$cmdDest   = "$claudeDir\commands"

Write-Host ""
Write-Host "No-Look Pass -- Installer"
Write-Host "========================="
Write-Host ""

# Check for Claude Code
if (-not (Test-Path $claudeDir)) {
    Write-Error "Claude Code config directory not found at $claudeDir"
    Write-Error "Make sure Claude Code is installed: https://claude.ai/code"
    exit 1
}

# Create directories
New-Item -ItemType Directory -Force "$skillDest\references" | Out-Null
New-Item -ItemType Directory -Force $cmdDest | Out-Null

# Copy skill files
Copy-Item SKILL.md $skillDest\
Copy-Item references\*.md "$skillDest\references\"
Copy-Item commands\alleyoop.md $cmdDest\
Copy-Item commands\slamdunk.md $cmdDest\

Write-Host "Installed:"
Write-Host "  $skillDest\SKILL.md"
Write-Host "  $skillDest\references\*.md"
Write-Host "  $cmdDest\alleyoop.md"
Write-Host "  $cmdDest\slamdunk.md"
Write-Host ""
Write-Host "Done! Open Claude Code in any project folder and run:"
Write-Host "  /alleyoop"
Write-Host ""
