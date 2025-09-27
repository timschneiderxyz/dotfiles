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
HISTFILE="${XDG_CACHE_HOME}/zsh/history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

# Completion
autoload -U compinit && compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/zsh/zcompcache"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'

# Aliases
source "${XDG_CONFIG_HOME}/zsh/aliases"

# Plugins
[ ! -d "${ZINIT_BIN_DIR}" ] && mkdir -p "$(dirname ${ZINIT_BIN_DIR})" && git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_BIN_DIR}"
source "${ZINIT_BIN_DIR}/zinit.zsh"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Initializations
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)

# Keybindings
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
