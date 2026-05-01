#!/bin/bash
export DENO_DIR="$HOME/.deno"
export PATH="$DENO_DIR/bin:$PATH"

function install_rad () {
  deno install --global --unstable -A -n rad https://raw.githubusercontent.com/cdaringe/rad/main/src/bin.ts
}
function install_deno_latest {
  clear_deno
  curl -fsSL https://deno.land/x/install/install.sh | sh
}

