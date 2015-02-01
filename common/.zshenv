#------------------------------
# Environment variables
#------------------------------
export TERMINAL=urxvtc
export PAGER=more
export LANG=en_AU.UTF-8
export EDITOR=vim
export VISUAL=gvim
if [ -n "$DISPLAY" ]; then
	export BROWSER=google-chrome-beta
else
	export BROWSER=lynx
fi
