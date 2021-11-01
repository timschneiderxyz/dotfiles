<#  ========================================================================
    # Setup - Apps
    ========================================================================  #>

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

# Manual
Start-Process "https://customer.focusrite.com/en/support/downloads?brand=Focusrite&product_by_range=1361&download_type=software"
Start-Process "https://www.jetbrains.com/lp/mono/"
Start-Process "https://github.com/tonsky/FiraCode"
Start-Process "https://windows.php.net/download/"
Start-Process "https://getcomposer.org/download/"

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
