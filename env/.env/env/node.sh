#!/bin/bash
export NODE_ENV='development'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
  if [[ -f .tool-versions && -r .tool-versions ]]; then
    asdf local $(cat .tool-versions)
  fi
}

cd() { builtin cd "$@"; 'load-nvmrc'; }
