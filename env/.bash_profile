#!/bin/bash

# setup startup profiling
# ts = timestamp
alias ts="true"
if hash perl 2>/dev/null
then
  echo "ts,call" > ~/.startup.debug.csv
  ## enable for debug mode
  # function ts() {
  #   _d=$(perl -MTime::HiRes=time -e "printf '%.9f, $1', time")
  #   echo "$_d" >> ~/.startup.debug.csv
  # }
fi

ts "load_/etc/bashrc"
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
ts "load_~/.bashrc"
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
