typeset -U path
path=(~/bin $path)

export PAGER=more

if [ -n "$DISPLAY" ]; then
	export EDITOR=gvim
	export VISUAL=gvim
	export BROWSER=google-chrome-beta
else
	export EDITOR=vim
	export BROWSER=lynx
fi
