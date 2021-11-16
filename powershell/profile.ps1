#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|


# Environment
$env:EDITOR = "code"

# Options
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Promt
function global:prompt {
  $startbracket = Write-Host -NoNewline -ForegroundColor Red "["
  $username = Write-Host -NoNewline -ForegroundColor Yellow $env:USERNAME
  $separator = Write-Host -NoNewline -ForegroundColor Green "@"
  $computername = Write-Host -NoNewline -ForegroundColor Blue $env:COMPUTERNAME
  $location = Write-Host -NoNewline -ForegroundColor Magenta " $(Split-Path -leaf -path (Get-Location))"
  $endbracket = Write-Host -NoNewline -ForegroundColor Red "]"

  "$startbracket$username$separator$computername$location$endbracket$([char]0x276F) "
}

# WinGet Completion
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
  [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
  $Local:word = $wordToComplete.Replace('"', '""')
  $Local:ast = $commandAst.ToString().Replace('"', '""')
  winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
    [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
  }
}

# System & Programs
# ==============================================================================

function x { exit }
function sudo { Start-Process -Verb RunAs wt }
function dotfiles { Invoke-WebRequest "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/dotfiles.ps1" | Invoke-Expression }
Set-Alias "e" "$env:EDITOR"
Set-Alias "g" "git"
Set-Alias "dns" "Resolve-DnsName"

function Set-ShutdownTimer([int]$timeInMinutes) {
  $timeInSeconds = $timeInMinutes * 60
  shutdown -s -t $timeInSeconds
  Write-Host "The Computer will shut down in $timeInMinutes minutes."
}
Set-Alias "sst" "Set-ShutdownTimer"
function ast { shutdown -a }

# Directories & Files
# ==============================================================================

function .. { Set-Location ".." }
function ... { Set-Location "..\.." }
function .... { Set-Location "..\..\.." }
function ..... { Set-Location "..\..\..\.." }
function ...... { Set-Location "..\..\..\..\.." }
function dl { Set-Location "$env:USERPROFILE\Downloads" }
function db { Set-Location "$env:USERPROFILE\Dropbox" }
function p { Set-Location "$env:USERPROFILE\Projekte" }
function touch([string[]]$file) { New-Item -ItemType File $file | Out-Null }
function mkd([string[]]$directory) { New-Item -ItemType Directory $directory | Out-Null }
function rmrf([string[]]$path) { Remove-Item -Recurse -Force $path }

# SSH
# ==============================================================================

function New-SshKey([string]$email, [string]$name) {
  ssh-keygen -t rsa -b 4096 -C $email -f $env:USERPROFILE\.ssh\$name
}
Set-Alias "sshn" "New-SshKey"

function Add-SshKey([string]$name) {
  ssh-add $env:USERPROFILE\.ssh\$name
}
Set-Alias "ssha" "Add-SshKey"

# Composer
# ==============================================================================

function fuckphp { Remove-Item -Recurse -Force -ea 0 vendor, composer.lock; composer clear-cache; composer update }

# npm
# ==============================================================================

function fuckjs { Remove-Item -Recurse -Force -ea 0 node_modules, package-lock.json; npm install }
function nid([string[]]$package) { npm install --save-prod $package }
function nidd([string[]]$package) { npm install --save-dev $package }
function no { npm outdated }
function nu { npm update }
function nd { npm run dev }
function np { npm run prod }
