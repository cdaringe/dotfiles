#!/bin/bash

function random-string() {
  sed "s/[^a-zA-Z0-9]//g" <<<$(openssl rand -base64 $1)
}

function openport() {
  lsof -i :$1
}

weather() { curl wttr.in/"$1"; }

get-vagrant-ip() {
  vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
}

alias sourceme="source ~/.bash_profile"
alias sm="sourceme"
alias gamedie="echo 🎲 | pbcopy"
alias aliases="$EDITOR ~/.aliases.sh"
