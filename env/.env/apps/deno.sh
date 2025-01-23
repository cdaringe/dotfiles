#!/bin/bash
export DENO_DIR="$HOME/.deno"
export PATH="$DENO_DIR/bin:$PATH"
DENO_ENV_FILE="$DENO_DIR/env"

if [ -f "$DENO_ENV_FILE" ]; then
  . "$DENO_ENV_FILE"
fi

deno_completions_filename=$HOME/.local/share/bash-completion/completions/deno.bash
# if command_exists deno; then
#   if [ ! $deno_completions_filename ]; then
#     mkdir -p "$(dirname $deno_completions_filename)"
#     deno completions bash > $deno_completions_filename
#   fi
#   source "$deno_completions_filename"
# fi

function install_rad_next () {
  deno install --unstable -A -n rad https://raw.githubusercontent.com/cdaringe/rad/next/src/bin.ts
}
function install_deno_latest {
  clear_deno
  curl -fsSL https://deno.land/x/install/install.sh | sh
}

