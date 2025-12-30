#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/


# Settings
export SHELL_SESSIONS_DISABLE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--style full --color 16"
export BAT_THEME="base16"

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ~/ Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZINIT_BIN_DIR="$XDG_DATA_HOME/zinit/bin"
export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
export LESSHISTFILE="-"
export AZURE_CONFIG_DIR="$XDG_CONFIG_HOME/azure"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export ANSIBLE_SSH_CONTROL_PATH_DIR="$XDG_CACHE_HOME/ansible/cp"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python/history"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/history"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
