# Ghostty ssh fix
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ setup
if [[ "$OSTYPE" == "darwin"* ]]; then
  export ZSH="$HOME/.oh-my-zsh"
else
  export ZSH="/usr/share/oh-my-zsh"
fi
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir $ZSH_CACHE_DIR

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    wd
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# CachyOS config
if [[ -f /usr/share/cachyos-zsh-config/cachyos-config.zsh ]]; then
  source /usr/share/cachyos-zsh-config/cachyos-config.zsh
fi

ZSH_AUTOSUGGEST_HISTORY_IGNORE=*

# p10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

setopt globdots

unsetopt correct_all
eval "$(fnm env --use-on-cd --shell zsh)"
