#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Other env vars
#

export NVM_DIR="$HOME/.nvm"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
export VBOX_USER_HOME=$HOME/vm

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_NZ.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/.local/bin
  /usr/local/bin
  $(ruby -e 'print Gem.user_dir')/bin
  $path
)

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
