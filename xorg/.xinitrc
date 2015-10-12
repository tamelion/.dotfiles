#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Start D-Bus
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Sync Xresources
xrdb -merge ~/.Xresources

# Run local hardware options script
local-hardware

# Bind multimedia keys
xbindkeys

# Turn num lock on
numlockx &

# Include xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# Start urxvt daemon
urxvtd -q -o -f

# Start clipmenu daemon
clipmenud &

# Export bin path for dmenu and other X apps
export PATH=$PATH:~/.bin

# Start WM
exec i3
