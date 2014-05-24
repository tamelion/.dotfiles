#------------------------------
# Variables
#------------------------------
export EDITOR="vim"

# Add local bin to $PATH
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# Set browser depending on environment
if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome-beta
else
    export BROWSER=lynx
fi
