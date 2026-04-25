#!/bin/bash
. ~/.basher.sh

source /home/cdaringe/.local/share/bash-completion/completions/deno.bash
. "$HOME/.cargo/env"

# fnm
FNM_PATH="/home/cdaringe/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell bash)"
fi
