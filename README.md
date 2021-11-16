# dotfiles

My dotfiles & configs.

## Setup

1. Update Windows (Settings -> Updates -> Search for Updates)
2. Update Apps (Store -> Library -> Search for Updates)
3. Install Drivers
4. Open Terminal as admin and run this command:

```PowerShell
iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/setup.ps1" | iex
```

5. Next, run these commands in a non-admin terminal:

```PowerShell
iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/apps.ps1" | iex
iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/dotfiles.ps1" | iex
```
