#Requires -RunAsAdministrator
Write-Host -ForegroundColor Yellow @"

         888          888     .d888 d8b 888
         888          888    d88P"  Y8P 888
         888          888    888        888
     .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
    d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
    888  888 888  888 888    888    888 888 88888888 "Y8888b.
d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'

=========================== Setup ===========================

"@

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Privacy & Security
# ==============================================================================

Write-Host -NoNewline "Setting up Privacy & Security..."

# General
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0 # Advertising ID for Apps
New-ItemProperty "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Value 1 | Out-Null # Websites access to language list
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_TrackProgs -Value 0 # Track Apps
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SilentInstalledAppsEnabled -Value 0 # Automatic installation of Apps
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SubscribedContent-338393Enabled -Value 0 # Suggested Content
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SubscribedContent-353694Enabled -Value 0 # Suggested Content
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SubscribedContent-353696Enabled -Value 0 # Suggested Content

# Inking & Typing
Set-ItemProperty "HKCU:\Software\Microsoft\InputPersonalization" -Name RestrictImplicitTextCollection -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\InputPersonalization" -Name RestrictImplicitInkCollection -Value 1

# Diagnostics & Feedback
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name MaxTelemetryAllowed -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name TailoredExperiencesWithDiagnosticDataEnabled -Value 0
New-Item -Force -ItemType Directory "HKCU:\Software\Microsoft\Siuf\Rules" | Out-Null
New-ItemProperty "HKCU:\Software\Microsoft\Siuf\Rules" -Name NumberOfSIUFInPeriod -Value 0 | Out-Null

# App Permissions
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name Value -Value Deny
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name Value -Value Deny

# Services
Get-Service "*DiagTrack*" | Set-Service -StartupType Disabled
Get-Service "*dmwappushservice*" | Set-Service -StartupType Disabled

# Tasks
Get-ScheduledTask "*Consolidator*" | Disable-ScheduledTask | Out-Null
Get-ScheduledTask "*UsbCeip*" | Disable-ScheduledTask | Out-Null

# Defender
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent NeverSend

Write-Host " Done"

# Apps
# ==============================================================================

Write-Host -NoNewline "Cleaning up Apps..."

# Apps
foreach ($app in @(
    "Microsoft.OneDrive"
  )) {
  winget uninstall $app
}

# Packages
foreach ($package in @(
    "*Microsoft.BingNews*"
    "*Microsoft.BingWeather*"
    "*Microsoft.GamingApp*"
    "*Microsoft.Getstarted*"
    "*Microsoft.MicrosoftOfficeHub*"
    "*Microsoft.MicrosoftSolitaireCollection*"
    "*Microsoft.MicrosoftStickyNotes*"
    "*Microsoft.OneDriveSync*"
    "*Microsoft.PowerAutomateDesktop*"
    "*Microsoft.Todos*"
    "*microsoft.windowscommunicationsapps*"
    "*Microsoft.WindowsFeedbackHub*"
    "*Microsoft.WindowsSoundRecorder*"
    "*Microsoft.Xbox.TCUI*"
    "*Microsoft.ZuneMusic*"
    "*Microsoft.ZuneVideo*"
    "*MicrosoftTeams*"

    "*MicrosoftWindows.Client.WebExperience*"
    "*Microsoft.GetHelp*"
  )) {
  Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -Like $package } | ForEach-Object { Remove-AppxProvisionedPackage -Online -PackageName $_.PackageName } | Out-Null
  Get-AppxPackage -AllUsers $package | Remove-AppxPackage
}

# Capabilities
foreach ($capability in @(
    "Microsoft.Windows.PowerShell.ISE"
    "Microsoft.Windows.WordPad"
    "Microsoft.Windows.Notepad.System"
    "Browser.InternetExplorer"
    "Media.WindowsMediaPlayer~~~~0.0.12.0"
    "App.Support.QuickAssist~~~~0.0.1.0"
    "App.StepsRecorder~~~~0.0.1.0"
    "MathRecognizer"
  )) {
  Remove-WindowsCapability -Online –Name $capability | Out-Null
}

Write-Host " Done"

# Preferences
# ==============================================================================

Write-Host -NoNewline "Setting up Preferences..."

# Disable fast startup
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name HiberbootEnabled -Value 0

# Disable Lock Screen
New-Item -Force -ItemType Directory "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" | Out-Null
New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name NoLockScreen -Value 1 | Out-Null

# Disable Wallpaper Compression
New-ItemProperty "HKCU:\Control Panel\Desktop" -Name JPEGImportQuality -Value 0x00000064 | Out-Null

# Enable Clipboard History
Set-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -Name EnableClipboardHistory -Value 1

# Mouse
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed -Value 0
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -Value 12

# Enable Dark Mode
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

# Explorer
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name ShowFrequent -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name LaunchTo -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name AutoCheckSelect -Value 0

# Taskbar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarDa -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarMn -Value 0

# Start Menu
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_TrackDocs -Value 0

Write-Host " Done"

# Environment
# ==============================================================================

Write-Host -NoNewline "Setting up Environment..."

# Variables
[Environment]::SetEnvironmentVariable("EDITOR", "code", 'User')
[Environment]::SetEnvironmentVariable("VSCODE_EXTENSIONS", "$env:APPDATA\Code\User\extensions", 'User')
[Environment]::SetEnvironmentVariable("LESSHISTFILE", "-", 'User')
[Environment]::SetEnvironmentVariable("WSL_HOME", "\\wsl.localhost\Ubuntu\home\tim", 'User')

# Directories
New-Item -Force -ItemType Directory "$env:APPDATA\PowerShell" | Out-Null # PowerShell
New-Item -Force -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\WindowsPowerShell" -Value "$env:APPDATA\PowerShell" | Out-Null # PowerShell
attrib +h +s /l "$env:USERPROFILE\Documents\WindowsPowerShell" # PowerShell
New-Item -Force -ItemType Directory "$env:APPDATA\Code\User" | Out-Null # VS Code
New-Item -Force -ItemType SymbolicLink -Path "$env:USERPROFILE\.vscode" -Value "$env:APPDATA\Code\User" | Out-Null # VS Code
attrib +h +s /l "$env:USERPROFILE\.vscode" # VS Code
New-Item -Force -ItemType Directory "$env:APPDATA\Docker" | Out-Null # Docker
New-Item -Force -ItemType SymbolicLink -Path "$env:USERPROFILE\.docker" -Value "$env:APPDATA\Docker" | Out-Null # Docker
attrib +h +s /l "$env:USERPROFILE\.docker" # Docker
New-Item -Force -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\My Games" -Value "$env:USERPROFILE\Saved Games" | Out-Null # My Games
attrib +h +s /l "$env:USERPROFILE\Documents\My Games" # My Games
attrib +h +s "$env:USERPROFILE\NTUSER.DAT"

Write-Host " Done"

# Apps
# ==============================================================================

# WinGet
foreach ($package in @(
    Google.Chrome
    Discord.Discord
    Spotify.Spotify
    Dropbox.Dropbox
    VideoLAN.VLC
    7zip.7zip
    Microsoft.VisualStudioCode
    Valve.Steam
  )) {
  winget install -i $package
}

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# VS Code Extensions
Write-Host "Installing VS Code Extensions..."
foreach ($extension in @(
    (Invoke-WebRequest "raw.githubusercontent.com/timschneiderxyz/dotfiles/main/vscode/extensions.md").Content.tostring() -split "[`r`n]" |
    Where-Object { $_ -match "- " } |
    ForEach-Object { $_.trimStart("- ") }
  )) {
  Write-Host ">>> $extension"
  code --install-extension $extension | Out-Null
}

# Other
Start-Process "https://www.jetbrains.com/lp/mono/"

# ==============================================================================

Write-Host -ForegroundColor Yellow @"

Setup completed!

"@
