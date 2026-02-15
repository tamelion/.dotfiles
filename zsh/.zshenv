#
# XDG
#
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z "$XDG_CACHE_HOME" ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -z "$XDG_DATA_HOME" ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi

# If there's not already a data directory, create it
[[ ! -d "${XDG_DATA_HOME}/zsh" ]] && mkdir -p "${XDG_DATA_HOME}/zsh"

# Disable telemetry for OpenSpec
export OPENSPEC_TELEMETRY=0

# Soure all further config from here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
