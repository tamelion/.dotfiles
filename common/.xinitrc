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

# Start WM
exec i3
