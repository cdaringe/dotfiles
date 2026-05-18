#!/bin/bash
# shellcheck shell=bash
add_brew_install "fnm"

load_nvmrc() {
  if command_exists fnm && [[ -f .nvmrc && -r .nvmrc ]]; then
    fnm use
  fi
}

if command_exists fnm; then
  eval "$(fnm env)"
fi

export SCARF_ANALYTICS=false

alias nono="rm -rf node_modules package-lock.json yarn.lock"

function npxbrk() {
  node --inspect-brk "./node_modules/.bin/$1" "${@:2}"
}

## npm
alias pkg="jq . package.json"
function npxd() {
  node --inspect-brk "./node_modules/.bin/$1" "${@:2}"
}

function node_dep_graph() {
  npx madge --image dependency-graph.png "$1"
}

alias p="pnpm"
