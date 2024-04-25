#!/bin/zsh
#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/


# Settings
export EDITOR="nvim"
export SHELL_SESSIONS_DISABLE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_API_AUTO_UPDATE_SECS=86400

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ~/ Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
export LESSHISTFILE="-"
export AZURE_CONFIG_DIR="$XDG_CONFIG_HOME/azure"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"
export RUSTUP_HOME="$XDG_BIN_HOME/rustup"
export CARGO_HOME="$XDG_BIN_HOME/rustup/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python/history"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export PNPM_HOME="$XDG_BIN_HOME/pnpm"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/history"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Add to $PATH
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -exec stat -nf %N: {} \;)%%:}"
export PATH="$PATH:$CARGO_HOME/bin"
