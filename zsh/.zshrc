# We have colours
export TERM="xterm-256color"
# Share history file amongst all Zsh sessions, ignoring dupes
setopt append_history share_history histignorealldups
# Switching directories for lazy people
setopt autocd
# Complete with menu
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# custom aliases
[ -f ~/.alias ] && source ~/.alias
# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# zplug
[ -f ~/.zplug/init.zsh ] && source ~/.zplug/init.zsh

zplug "bhilburn/powerlevel9k", as:theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm time)

zplug "unixorn/git-extra-commands"

zplug "Tarrasch/zsh-bd" # bd to go back up to a dir

export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"
zplug "lukechilds/zsh-better-npm-completion"

# These two last
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Check for plugins which need installing
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load
