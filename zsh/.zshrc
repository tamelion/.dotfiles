#########################
# General
#########################

# We have colours
export TERM="xterm-256color"
# Share history file amongst all Zsh sessions, ignoring dupes
setopt append_history share_history histignorealldups
# Complete with menu
zstyle ':completion:*' menu select

# custom aliases
[ -f ~/.alias ] && source ~/.alias
# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



#########################
# Zplug
#########################

# check zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# init
source ~/.zplug/init.zsh

# theme
zplug "denysdovhan/spaceship-zsh-theme", as:theme
SPACESHIP_PROMPT_SYMBOL='➔'
SPACESHIP_VI_MODE_SHOW=false

# more commands for git
zplug "unixorn/git-extra-commands"

# bookmarks
zplug "urbainvaes/fzf-marks"

# bd to go back up to a dir
zplug "Tarrasch/zsh-bd"

# nvm
zplug "lukechilds/zsh-nvm"

# syntax highlighting and history come last
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
