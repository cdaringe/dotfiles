#!/bin/bash

function random-string() {
  # shellcheck disable=SC2001
  # shellcheck disable=SC2046
  sed "s/[^a-zA-Z0-9]//g" <<<$(openssl rand -base64 "$1")
}

function openport() {
  lsof -i :"$1"
}

alias sourceme="source ~/.bash_profile"
alias sm="sourceme"
alias gamedie="echo 🎲 | pbcopy"
alias aliases='$EDITOR ~/.aliases.sh'
