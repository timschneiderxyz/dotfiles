#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|


# Add to $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:$(find $HOME/.local/bin -maxdepth 1 -type d | paste -sd ':' -)"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:$PNPM_HOME"
