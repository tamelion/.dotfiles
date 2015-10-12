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
export VBOX_USER_HOME=~/vm
# for bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
# for npm
export NPM_CONFIG_PREFIX=~/.node_modules
