<#  ========================================================================
    # Setup - Copy
    ========================================================================  #>

# PowerShell Profile
Write-Host "Installing PowerShell profile..." -NoNewline
if (!(Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
  New-Item "$env:USERPROFILE\Documents\WindowsPowerShell" -ItemType Directory | Out-Null
}
Copy-Item "$dotfiles\powershell\profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1"
Write-Host " Done"

# Windows Terminal
$dirWT = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
if ($dirWT) {
  Write-Host "Installing Windows Terminal settings..." -NoNewline
  Copy-Item "$dotfiles\terminal\settings.json" "$dirWT\LocalState\settings.json"
  Write-Host " Done"
}

# VS Code
if (Get-Command code -ea 0) {
  Write-Host "Installing VS Code settings..." -NoNewline
  Copy-Item "$dotfiles\vscode\settings.json" "$env:APPDATA\Code\User\settings.json"
  Write-Host " Done"

  Write-Host "Installing VS Code extensions..."
  foreach ($extension in @(
      Get-Content "$dotfiles\vscode\extensions.md" |
      Where-Object { $_ -match "- " } |
      ForEach-Object { $_.trimStart("- ") }
    )) {
    Write-Host ">>> $extension"
    code --install-extension $extension | Out-Null
  }
}

# SSH
Write-Host "Installing SSH config..." -NoNewline
if (!(Test-Path "$env:USERPROFILE\.ssh")) {
  New-Item "$env:USERPROFILE\.ssh" -ItemType Directory | Out-Null
}
Copy-Item "$dotfiles\ssh\config" "$env:USERPROFILE\.ssh\config"
Write-Host " Done"

# Git
Write-Host "Installing Git config..." -NoNewline
if (!(Test-Path "$env:USERPROFILE\.config\git")) {
  New-Item "$env:USERPROFILE\.config\git" -ItemType Directory | Out-Null
}
Copy-Item "$dotfiles\git\config" "$env:USERPROFILE\.config\git\config"
Write-Host " Done"
