#!/bin/bash
alias nono="rm -rf node_modules package-lock.json yarn.lock"
function nrc () {
  echo "Activating .npmrc: $1"
  npmrc $1
  sourceme
}
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
