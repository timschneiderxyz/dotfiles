#                         __ _ _
#    _____ __  _ __ ___  / _(_) | ___
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|


# Add to $PATH
typeset -U path
eval "$(/opt/homebrew/bin/brew shellenv)"
path+=(
  $PNPM_HOME/bin
  $CARGO_HOME/bin
  $GOPATH/bin
  $HOME/.local/bin
  $HOME/.local/bin/*(N/)
)
eval "$(mise activate zsh --shims)"
