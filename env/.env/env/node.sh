#!/bin/bash
export NODE_ENV='development'

export PATH=/home/cdaringe/.fnm:$PATH
eval "`fnm env --multi`"

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    fnm use
  fi
  # if [[ -f .tool-versions && -r .tool-versions ]]; then
    # asdf local $(cat .tool-versions)
  # fi
}
export SCARF_ANALYTICS=false
cd() { builtin cd "$@"; 'load-nvmrc'; }
