#!/bin/bash
export DENO_DIR="$HOME/.deno"
export PATH="$DENO_DIR/bin:$PATH"
function clear_deno () {
  rm -rf $DENO_DIR
}

function install_rad_next () {
  deno install --unstable -A -n rad https://raw.githubusercontent.com/cdaringe/rad/next/src/bin.ts
}
function install_deno_latest {
  clear_deno
  curl -fsSL https://deno.land/x/install/install.sh | sh
}

