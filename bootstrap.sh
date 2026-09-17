#!/bin/zsh
#  _               _     _
# | |__   ___   ___ | |_ ___| |_ _ __ __ _ _ __
# | '_ \ / _ \ / _ \| __/ __| __| '__/ _` | '_ \
# | |_) | (_) | (_) | |_\__ \ |_| | | (_| | |_) |
# |_.__/ \___/ \___/ \__|___/\__|_|  \__,_| .__/
#                                         |_|


set -eu -o pipefail

repo="${0:A:h}"

# 1. sudo - Keep alive until the script exits.
sudo -v
while true; do sudo -n true; sleep 60; kill -0 $$ 2>/dev/null || exit; done &

# 2. macOS - Set defaults.
zsh "$repo/macos.sh"

# 3. Homebrew - Install formulae and casks.
[ -x /opt/homebrew/bin/brew ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file="$repo/Brewfile"

# 4. mise - Directories, dotfiles and tools.
[ -x "$HOME/.local/bin/mise" ] || curl -fsSL https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"
cd "$repo"
mise trust
mise bootstrap
