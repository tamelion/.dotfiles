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

# Set brightness to sensible level
xbacklight -set 25

# Bind multimedia keys
xbindkeys

# Include xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# Start urxvt daemon
urxvtd -q -o -f

# Export bin path for dmenu and other X apps
export PATH=$PATH:~/.bin

# Start WM
exec i3
