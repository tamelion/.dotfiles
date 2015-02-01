# Automatic startx on VT1 only
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
