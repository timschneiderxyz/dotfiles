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

"@

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Telemetry
# ==============================================================================

Write-Host -NoNewline "Disabling Telemetry..."

# General
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name MaxTelemetryAllowed -Value 0

# Feedback
$pathFeedback = "HKCU:\Software\Microsoft\Siuf\Rules"
if (!(Test-Path $pathFeedback)) {
  New-Item -ItemType Directory $pathFeedback | Out-Null
}
New-ItemProperty $pathFeedback -Name NumberOfSIUFInPeriod -Value 0 | Out-Null

# Services
Get-Service "*DiagTrack*" | Set-Service -StartupType Disabled

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
    "*Microsoft.GetHelp*"
  )) {
  Get-AppxPackage -AllUsers $package | Remove-AppxPackage
}

# Capabilities
foreach ($capability in @(
    "Microsoft.Windows.PowerShell.ISE"
    "Microsoft.Windows.WordPad"
    "Microsoft.Windows.Notepad.System"
    "Media.WindowsMediaPlayer~~~~0.0.12.0"
    "App.Support.QuickAssist~~~~0.0.1.0"
    "App.StepsRecorder~~~~0.0.1.0"
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
$pathLockScreen = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
if (!(Test-Path $pathLockScreen)) {
  New-Item -ItemType Directory $pathLockScreen | Out-Null
}
New-ItemProperty $pathLockScreen -Name NoLockScreen -Value 1 | Out-Null

# Enable Clipboard History
Set-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -Name EnableClipboardHistory -Value 1

# Mouse
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed -Value 0
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -Value 12

# Enable Dark Mode
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

# Explorer
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name LaunchTo -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name AutoCheckSelect -Value 0

# Taskbar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarDa -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarMn -Value 0

Write-Host " Done"

# ==============================================================================

Write-Host -ForegroundColor Yellow @"

Setup completed!

"@
