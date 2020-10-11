#!/bin/bash
export NODE_ENV='development'
export PATH=/home/cdaringe/.fnm:$PATH
eval "$(fnm env --multi)"
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
