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

# Set up external mouse
xinput --set-prop 'Arc Touch BT Mouse' 'Device Accel Constant Deceleration' 4 &
xset mouse 4 6 &

# Bind multimedia keys
xbindkeys

# Turn num lock on
numlockx &

# Set brightness
###xbacklight -set 33

# Check state of external monitors
monitor-toggle

# Export bin path for dmenu and other X apps
export PATH=$PATH:~/.bin

# Start urxvt daemon
urxvtd -q -o -f

# Start clipmenu daemon
clipmenud &

# Include xprofile
###[ -f ~/.xprofile ] && source ~/.xprofile

# Start WM
exec i3
