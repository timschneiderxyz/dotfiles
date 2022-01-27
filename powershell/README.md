# PowerShell Profile

## Installation

1. Run as Admin: `Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force`
2. Copy `profile.ps1` to `C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1`.

## Functions & Aliases

Common:

- `x` = Close Terminal
- `sudo` = Open Terminal as admin
- `dotfiles` = Update dotfiles
- `sst` = Set a shutdown timer
- `sshkg` = Generate new SSH key
- `dns` = `Resolve-DnsName`
- `e` = `code`
- `g` = `git`

Directories & Files:

- `..`, `...`, `....` = Directories up
- `dl` = Change directory to Downloads
- `p` = Change directory to Projects
- `ll` = List all directories/files in the current directory, including hidden ones
- `touch` = Create new file
- `mkd` = Create new directory
- `rmrf` = Deletes directories/files with the params "recurse" and "force"

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
