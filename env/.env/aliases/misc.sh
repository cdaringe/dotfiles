#!/bin/bash

function random-string () {
  cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z' | fold -w $1 | head -n 1
}

function openport () {
  lsof -i :$1
}

weather() { curl wttr.in/"$1"; }

get-vagrant-ip () {
  vagrant ssh -c "hostname -I | cut -d' ' -f2" 2>/dev/null
}
alias sourceme="source ~/.bash_profile"
alias sm="sourceme"
alias gamedie="echo 🎲 | pbcopy"
alias aliases="$EDITOR ~/.aliases.sh"


