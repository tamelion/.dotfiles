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
if [ -s ~/.Xresources ]; then
	xrdb -merge ~/.Xresources
fi

# Bind multimedia keys
xbindkeys

# Turn num lock on
numlockx &

# Run local scripts
autorun-scripts

# Export bin path for dmenu and other X apps
export PATH=$PATH:~/.local/bin

# Start clipmenu daemon
clipmenud &

# Start WM
exec i3
