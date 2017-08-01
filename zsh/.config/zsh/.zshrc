#
# General
#

# Write history when term exits, remove duplicates
setopt append_history hist_ignore_all_dups
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Complete with menu
zstyle ':completion:*' menu select

# custom aliases
[[ -f "$XDG_CONFIG_HOME/zsh/.alias" ]] && source "$XDG_CONFIG_HOME/zsh/.alias"
# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#
# Zplug
#

# If not installed
if [[ ! -d "$ZPLUG_HOME" ]]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

# If installed
if [[ -s "$ZPLUG_HOME" ]]; then
  # init
  source $ZPLUG_HOME/init.zsh

  # theme
  zplug "denysdovhan/spaceship-zsh-theme", as:theme
  SPACESHIP_PROMPT_SYMBOL='¯\_(ツ)_/¯'
  SPACESHIP_VI_MODE_SHOW=false

  # more commands for git
  zplug "unixorn/git-extra-commands"

  # bookmarks
  zplug "urbainvaes/fzf-marks"

  # bd to go back up to a dir
  zplug "Tarrasch/zsh-bd"

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
fi
