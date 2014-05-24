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
    export BROWSER=chromium
else
    export BROWSER=lynx
fi
