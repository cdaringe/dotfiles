#!/bin/bash
# setup startup profiling
# ts = timestamp
function ts() {
  true
}
alias tsflush="true"
alias tslog=""
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

[ -z "$PS1" ] && return

ts "load_/etc/bashrc"
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# bash specific aliases
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# load all env, apps, & aliases files
for file in ~/.env/env/*.sh; do
  ts "load_env_$file"
  . "$file"
done
. "$HOME/.env/env/__final__"

for file in ~/.env/apps/*.sh; do
  ts "load_apps_$file"
  . "$file";
done

# load untracked files ;)
ts "load_secrets"
if [ -f ~/.secrets.sh ]; then . ~/.secrets.sh; fi
ts "load_work"
if [ -f ~/.work.sh ]; then . ~/.work.sh; fi

ts "done"
tsflush

# echo 🌲
