#------------------------------
# Environment variables
#------------------------------
export TERMINAL=urxvtc
export PAGER=more
export LANG=en_AU.UTF-8
export VISUAL=gvim
if [ -n "$DISPLAY" ]; then
	export BROWSER=google-chrome-beta
	export EDITOR=gvim
else
	export BROWSER=lynx
	export EDITOR=vim
fi
export DMENU_OPTIONS='-i -h 18 -sb #de935f -sf #1d1f21 -nb #373b41 -nf #b4b7b4 -fn xft:DejaVuSansMono:antialias=true:pixelsize=11'
export VBOX_USER_HOME=~/vm
# for bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
