# startx on VT1 only
if [[ `uname` == 'Linux' ]]; then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
