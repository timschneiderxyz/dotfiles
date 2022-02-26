# dotfiles

My dotfiles & configs.

## Setup

1. Update Windows (Settings -> Updates -> Search for Updates)
2. Update Apps (Store -> Library -> Search for Updates)
3. Install Drivers
4. (PowerShell) Run as Admin: `iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/win-setup.ps1" | iex`
5. (PowerShell) Run: `iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/win-copy.ps1" | iex`
6. (PowerShell) Install WSL: `wsl --install`
7. (WSL) Run: `curl -fsSL https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/wsl-setup.sh | sh`
8. (PowerShell) Install Docker: `winget install -i Docker.DockerDesktop`
