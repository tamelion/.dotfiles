#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

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

# Start WM
exec i3
