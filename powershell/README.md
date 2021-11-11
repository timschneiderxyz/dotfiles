# PowerShell Profile

## Installation

Before installation, we have to set our PowerShell execution policy to allow the use of scripts.
To do this, open your PowerShell as an administrator and run the following command:

```PowerShell
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
```

Then copy `profile.ps1` to `C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1`.

## Content

### Promt

```plaintext
[Username@Computername CurrentLocation]❯
```

### Commands

System & Programs:

- `x` = Close Terminal
- `sudo` = Open Terminal as admin
- `update` = Update dotfiles
- `e` = Shortcut for the default Editor
- `dns` = Get DNS infos
- `Set-ShutdownTimer` / `sst` = Set a shutdown timer
- `ast` = Abort the shutdown timer

Directories & Files:

- `..`, `...`, `....`, `.....`, `......` = Directories up
- `dl` = Change directory to Downloads
- `db` = Change directory to Dropbox
- `p` = Change directory to Projects
- `touch` = Create new file
- `mkd` = Create new directory
- `rmrf` = Deletes directories/files with the params "recurse" and "force"

SSH:

- `New-SshKey` / `sshn` = Generate new SSH key
- `Add-SshKey` / `ssha` = Add SSH key

[Composer](https://getcomposer.org/):

- `fuckphp` = Delete vendor and composer.lock, then clear the cache and reinstall everything

[npm](https://www.npmjs.com):

- `fuckjs` = Delete node_modules and package-lock.json, then reinstall everything
- `nid` = Install package in dependencies
- `nidd` = Install package in devDependencies
- `no` = List all outdated packages
- `nu` = Update all packages
- `nd` = Run development script
- `np` = Run production script
