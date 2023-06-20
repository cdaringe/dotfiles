#!/bin/bash
function command_exists() {
  command -v "$1" &>/dev/null
}

IS_DOTFILES_PROFILING=

alias tslog=""

if [ "$IS_DOTFILES_PROFILING" = "1" ]; then
  # enable for debug mode
  # comment out-for noop!
  function ts() {
    tslog="$tslog$(date +%s),$1\n"
  }
  function tsflush() {
    local dest=~/.startup.debug.csv
    printf "timestamp,call\n$tslog" >$dest
    echo contents flushed to $dest
  }
else
  function ts() {
    true
  }
  function tsflush() {
    true
  }
fi
