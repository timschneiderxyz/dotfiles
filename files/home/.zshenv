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
export DOTNET_CLI_TELEMETRY_OPTOUT=1

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
export PULUMI_HOME="$XDG_DATA_HOME/pulumi"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"
export KUBECONFIG="$XDG_CONFIG_HOME/kube/config"
export KUBECACHEDIR="$XDG_CACHE_HOME/kube"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql/history"
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"
export NUGET_PACKAGES="$XDG_DATA_HOME/NuGet/packages"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python/history"
export PNPM_HOME="$XDG_BIN_HOME/pnpm"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node/history"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# Add to $PATH
export PATH="$PATH:/opt/homebrew/bin"
export PATH="$PATH:$(find ~/.local/bin -maxdepth 1 -type d | paste -sd ':' -)"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"
