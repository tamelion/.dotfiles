#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source custom aliases
if [[ -s "${ZDOTDIR:-$HOME}/.alias" ]]; then
  source "${ZDOTDIR:-$HOME}/.alias"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
