#------------------------------
# Includes
#------------------------------
# Aliases
if [ -f ~/.alias ]; then
	source ~/.alias
fi

#------------------------------
# History
#------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Keybindings
#------------------------------
# Use vim style
bindkey -v

typeset -g -A key
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

#------------------------------
# Autocomplete
#------------------------------
zmodload zsh/complist
autoload -Uz compinit && compinit
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Colour scheme
#------------------------------
# Get base16-shell theme from https://github.com/chriskempson/base16-shell
#BASE16_SCHEME="tomorrow"
#BASE16_SHELL="$HOME/.dotfiles/scripts/base16-$BASE16_SCHEME.dark.sh"
#[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
# Coloured ls in Termite
eval $(dircolors ~/.dircolors)

#------------------------------
# Prompt
#------------------------------
autoload -U promptinit && promptinit
prompt fade blue

