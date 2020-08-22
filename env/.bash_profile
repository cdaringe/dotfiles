#!/bin/bash

# setup startup profiling
# ts = timestamp
alias ts="true"
alias tsflush="true"
tslog=""
if hash gdate 2>/dev/null
then
  true
  # enable for debug mode
  # comment out-for noop!
  # unalias ts
  # unalias tsflush
  # function ts() {
  #   tslog="$tslog$(gdate +%s%N),$1\n"
  # }
  # function tsflush() {
  #   printf "timestamp,call\n$tslog" > ~/.startup.debug.csv
  # }
fi

ts "load_/etc/bashrc"
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
ts "load_~/.bashrc"
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
ts "done"
tsflush
