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
HISTFILE=~/.cache/zsh/zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# History Search
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward-end
bindkey "${terminfo[kcud1]}" history-beginning-search-forward-end

# Completion
autoload -U compinit && compinit -d ~/.cache/zsh/zcompdump
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Prompt
PS1="%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ "

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"

# Plugins
[ -f "$XDG_DATA_HOME/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$XDG_DATA_HOME/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh"
