#!/bin/bash
add_brew_install "fnm"

if [[ -f "$HOME/.fnm/fnm" ]]; then
  export PATH="$HOME/.fnm:$PATH"
fi

load_nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    fnm use
  fi
}
if command_exists fnm; then
  eval "$(fnm env)"
fi

export SCARF_ANALYTICS=false

alias nono="rm -rf node_modules package-lock.json yarn.lock"

function npxbrk() {
  node --inspect-brk "./node_modules/.bin/$@"
}

## npm
alias nga="mv .npmrc .npmrcbu" # npmrc... go away!
alias ncb="mv .npmrcbu .npmrc" # npmrc... come back!
alias pkg="cat package.json | jq ."
alias nono="rm -rf node_modules package-lock.json yarn.lock"
function npxd() {
  node --inspect-brk ./node_modules/.bin/$@
}

alias ybs="yarn bootstrap"

function node_dep_graph() {
  npx madge --image dependency-graph.png $1
}

alias p="pnpm"
alias pi="pnpm install"
alias x="pnpm exec"
alias pd="pnpm dlx"
