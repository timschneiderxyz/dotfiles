Write-Host -ForegroundColor Yellow @"

         888          888     .d888 d8b 888
         888          888    d88P"  Y8P 888
         888          888    888        888
     .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
    d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
    888  888 888  888 888    888    888 888 88888888 "Y8888b.
d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'

=========================== Copy ============================

"@

# Download
# ==============================================================================

Write-Host -NoNewline "Download dotfiles..."

# Download repository
$dotfilesRepoUrl = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$dotfilesZip = "$env:USERPROFILE\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($dotfilesRepoUrl, $dotfilesZip)

# Unpack & delete zip file
Expand-Archive $dotfilesZip "$env:USERPROFILE\Downloads"
Remove-Item $dotfilesZip

# Set path
$dotfiles = "$env:USERPROFILE\Downloads\dotfiles-master"

Write-Host " Done"

# Copy
# ==============================================================================

# PowerShell Profile
Write-Host -NoNewline "Copy PowerShell profile..."
Copy-Item "$dotfiles\powershell\profile.ps1" "$env:USERPROFILE\.config\powershell\profile.ps1"
Write-Host " Done"

# Windows Terminal
Write-Host -NoNewline "Copy Windows Terminal settings..."
$dirWT = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
Copy-Item "$dotfiles\terminal\settings.json" "$dirWT\LocalState\settings.json"
Write-Host " Done"

# VS Code
Write-Host -NoNewline "Copy VS Code settings..."
Copy-Item "$dotfiles\vscode\settings.json" "$env:APPDATA\Code\User\settings.json"
Write-Host " Done"

# SSH
Write-Host -NoNewline "Copy SSH config..."
Copy-Item "$dotfiles\ssh\config" "$env:USERPROFILE\.config\ssh\config"
Write-Host " Done"

# Git
Write-Host -NoNewline "Copy Git config..."
Copy-Item "$dotfiles\git\config" "$env:USERPROFILE\.config\git\config"
Write-Host " Done"

# ==============================================================================

Remove-Item -Recurse -Force $dotfiles
Write-Host -ForegroundColor Yellow @"

Dotfiles copied!

"@
