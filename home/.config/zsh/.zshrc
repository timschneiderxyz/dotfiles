#!/bin/zsh
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|


# General
stty stop undef
setopt NO_BEEP
setopt INTERACTIVE_COMMENTS
setopt GLOB_DOTS
setopt AUTO_CD
autoload -U colors && colors

# History
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Completion
autoload -U compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Aliases
[ -f "$XDG_CONFIG_HOME/zsh/aliases" ] && source "$XDG_CONFIG_HOME/zsh/aliases"

# Plugins
[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ] && source "/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Initializations
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Keybindings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
