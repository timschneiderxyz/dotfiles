<#  ========================================================================
    # Setup - Windows
    ========================================================================  #>

# Telemetry
# ==============================================================================

Write-Host "Disabling Telemetry..." -NoNewline

# General
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name MaxTelemetryAllowed -Value 0

# Feedback
$pathFeedback = "HKCU:\Software\Microsoft\Siuf\Rules"
if (!(Test-Path $pathFeedback)) {
  New-Item $pathFeedback -ItemType Directory -Force -ea 0 | Out-Null
}
New-ItemProperty $pathFeedback -Name NumberOfSIUFInPeriod -Value 0 -ea 0 | Out-Null

# Services
Get-Service "*DiagTrack*" | Set-Service -StartupType Disabled -ea 0 | Out-Null

# Tasks
Get-ScheduledTask "*Consolidator*" | Disable-ScheduledTask -ea 0 | Out-Null
Get-ScheduledTask "*UsbCeip*" | Disable-ScheduledTask -ea 0 | Out-Null

# Defender
Set-MpPreference -MAPSReporting Disabled
Set-MpPreference -SubmitSamplesConsent NeverSend

Write-Host " Done"

# Apps
# ==============================================================================

Write-Host "Cleaning up Apps..." -NoNewline

# Apps
foreach ($app in @(
    "Microsoft.OneDrive"
  )) {
  winget uninstall $app
}

# App Packages
foreach ($package in @(
    "*Microsoft.BingNews*"
    "*Microsoft.BingWeather*"
    "*Microsoft.GamingApp*"
    "*Microsoft.Getstarted*"
    "*Microsoft.MicrosoftOfficeHub*"
    "*Microsoft.MicrosoftSolitaireCollection*"
    "*Microsoft.MicrosoftStickyNotes*"
    "*Microsoft.PowerAutomateDesktop*"
    "*Microsoft.Todos*"
    "*microsoft.windowscommunicationsapps*"
    "*Microsoft.WindowsFeedbackHub*"
    "*Microsoft.WindowsSoundRecorder*"
    "*Microsoft.ZuneMusic*"
    "*Microsoft.ZuneVideo*"
    "*MicrosoftTeams*"
    "*Microsoft.GetHelp*"
  )) {
  Get-AppxPackage -AllUsers $package | Remove-AppxPackage
}

# Windows Capabilities
foreach ($capability in @(
    "Microsoft.Windows.PowerShell.ISE"
    "Microsoft.Windows.WordPad"
    "Microsoft.Windows.Notepad.System"
    "Media.WindowsMediaPlayer~~~~0.0.12.0"
    "App.Support.QuickAssist~~~~0.0.1.0"
    "App.StepsRecorder~~~~0.0.1.0"
  )) {
  Remove-WindowsCapability -Online –Name $capability
}

Write-Host " Done"

# Preferences
# ==============================================================================

Write-Host "Setting up Preferences..." -NoNewline

# Disable fast startup
Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name HiberbootEnabled -Value 0

# Disable Lock Screen
$pathLockScreen = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
if (!(Test-Path $pathLockScreen)) {
  New-Item $pathLockScreen -ItemType Directory -Force -ea 0 | Out-Null
}
New-ItemProperty $pathLockScreen -Name NoLockScreen -Value 1 -ea 0 | Out-Null

# Enable Dark Mode
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name SystemUsesLightTheme -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

# Explorer
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name LaunchTo -Value 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Hidden -Value 1

# Taskbar
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name SearchboxTaskbarMode -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarDa -Value 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name TaskbarMn -Value 0

# Mouse
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed -Value 0
Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -Value 12

# Enable Clipboard History
Set-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -Name EnableClipboardHistory -Value 1

Write-Host " Done"
