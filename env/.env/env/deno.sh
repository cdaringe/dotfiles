#!/bin/bash
export PATH="/home/cdaringe/.deno/bin:$PATH"
export DENO_DIR=~/.deno
function clear_deno () {
  rm -rf $DENO_DIR
}

function install_rad_next () {
  deno install --unstable -A -n rad https://raw.githubusercontent.com/cdaringe/rad/next/src/bin.ts
}
function install_deno_42 {
  clear_deno
  curl -fsSL https://deno.land/x/install/install.sh | sh -s v0.42.0
}
function install_deno_latest {
  clear_deno
  curl -fsSL https://deno.land/x/install/install.sh | sh
}

