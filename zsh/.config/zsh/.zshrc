#
# Environment variables
#

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_NZ.UTF-8'
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Editors
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Less (disable history)
export PAGER='less'
export LESSHISTFILE=-

# Virtual machines
export VBOX_USER_HOME=$HOME/vm

# fzf (use ripgrep)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

# docker uses podman
# NOTE: on a new host, enable the podman system service using:
# systemctl --user enable podman.socket
# systemctl --user start podman.socket
export DOCKER_HOST="unix:///run/user/1000/podman/podman.sock"

#
# Paths
#
path=(
$HOME/.local/bin
$HOME/.local/share/pnpm
/usr/local/bin
$path
)

# Ensure unique paths in array
typeset -gU cdpath fpath mailpath path

#
# History, completion, aliases
#

# Write history when term exits, remove duplicates
setopt append_history hist_ignore_all_dups
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Complete with menu
zstyle ':completion:*' menu select

# Add custom aliases
[[ -f "$XDG_CONFIG_HOME/zsh/.alias" ]] && source "$XDG_CONFIG_HOME/zsh/.alias"

# fuzzy find
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Config repositories
#

# Add LazyVim if no nvim config
NVIM_CONFIG="$XDG_CONFIG_HOME/nvim"
[ ! -d $NVIM_CONFIG ] && git clone --depth 1 https://github.com/LazyVim/starter $NVIM_CONFIG

# tmux plugin manager
TPM_CONFIG="$XDG_CONFIG_HOME/tmux/plugins/tpm"
[ ! -d $TPM_CONFIG ] && git clone --depth 1 https://github.com/tmux-plugins/tpm $TPM_CONFIG

#
# Zinit
#

ZINIT_HOME="$XDG_DATA_HOME/zinit"
[ ! -d $ZINIT_HOME ] && git clone --depth 1 https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source $ZINIT_HOME/zinit.zsh

export ZPLUG_HOME="$XDG_DATA_HOME/zplug"

# Load theme
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
