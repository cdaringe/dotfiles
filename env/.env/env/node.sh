#!/bin/bash
export NODE_ENV='development'
export NVM_DIR="$HOME/.nvm"
export IS_NVM_LOADED=;

function load_nvm () {
  echo "lazy loading nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function nvm_lazy () {
  unset nvm;
  load_nvm;
  nvm "$@"
}
alias nvm="nvm_lazy"

load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
  if [[ -f .tool-versions && -r .tool-versions ]]; then
    asdf local $(cat .tool-versions)
  fi
}
export SCARF_ANALYTICS=false
cd() { builtin cd "$@"; 'load-nvmrc'; }
