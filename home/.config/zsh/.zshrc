#!/bin/zsh
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|


# General
stty stop undef
setopt no_beep
setopt interactive_comments
setopt glob_dots
setopt auto_cd
autoload -U colors && colors

# History
HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Completion
autoload -U compinit && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Plugins
source "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh"

# Initializations
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Keybindings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
