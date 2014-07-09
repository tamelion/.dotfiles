#------------------------------
# Variables
#------------------------------
export EDITOR="vim"

# Set browser depending on environment
if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome-beta
else
    export BROWSER=lynx
fi
