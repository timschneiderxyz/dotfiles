Write-Host -ForegroundColor Yellow @"

         888          888     .d888 d8b 888
         888          888    d88P"  Y8P 888
         888          888    888        888
     .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
    d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
    888  888 888  888 888    888    888 888 88888888 "Y8888b.
d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'

=========================== Apps ============================

"@

# Manual
Start-Process "https://www.jetbrains.com/lp/mono/"
Start-Process "https://windows.php.net/download/"
Start-Process "https://getcomposer.org/download/"

# WinGet
foreach ($package in @(
    # General
    "Google.Chrome"
    "Discord.Discord"
    "Spotify.Spotify"
    "Dropbox.Dropbox"
    "VideoLAN.VLC"

    # Productivity
    "Microsoft.VisualStudioCode"
    "Git.Git"
    "OpenJS.NodeJS.LTS"

    # Games
    "Valve.Steam"
  )) {
  winget install -i $package
}

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# VS Code Extensions
Write-Host "Installing VS Code Extensions..."
foreach ($extension in @(
    (Invoke-WebRequest "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/vscode/extensions.md").Content.tostring() -split "[`r`n]" |
    Where-Object { $_ -match "- " } |
    ForEach-Object { $_.trimStart("- ") }
  )) {
  Write-Host ">>> $extension"
  code --install-extension $extension | Out-Null
}

Write-Host -ForegroundColor Yellow @"

Apps installed!

"@
