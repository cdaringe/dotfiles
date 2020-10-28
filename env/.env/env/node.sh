#!/bin/bash
export NODE_ENV='development'
export PATH=/home/cdaringe/.fnm:$PATH
eval "$(fnm env)"
# export NVM_DIR="$HOME/.nvm"
# export IS_NVM_LOADED=;
# function load_nvm () {
#   echo "lazy loading nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }
# function _load_nvm () {
#   unalias nvm;
#   unalias node;
#   load_nvm;
# }
# function nvm_lazy () {
#   _load_nvm;
#   nvm "$@";
# }
# function node_lazy () {
#   _load_nvm;
#   node "$@"
# }
# alias nvm="nvm_lazy"
# alias node="node_lazy"
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    fnm use
  fi
  # if [[ -f .tool-versions && -r .tool-versions ]]; then
    # asdf local $(cat .tool-versions)
  # fi
}
cd() { builtin cd "$@"; 'load-nvmrc'; }
export SCARF_ANALYTICS=false

alias nono="rm -rf node_modules package-lock.json yarn.lock"

function npxbrk () {
  node --inspect-brk ./node_modules/.bin/$@
}


## npm
alias nga="mv .npmrc .npmrcbu" # npmrc... go away!
alias ncb="mv .npmrcbu .npmrc" # npmrc... come back!
alias pkg="cat package.json | jq ."
alias nono="rm -rf node_modules package-lock.json yarn.lock"
function npxd () {
  node --inspect-brk ./node_modules/.bin/$@
}

alias ybs="yarn bootstrap"

function node_dep_graph () {
  npx madge --image dependency-graph.png $1
}
