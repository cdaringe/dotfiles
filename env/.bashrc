#!/bin/bash

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# bash specific aliases
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# load all env, apps, & aliases files
for file in ~/.env/env/*.sh; do . "$file"; done
for file in ~/.env/aliases/*.sh; do . "$file"; done
for file in ~/.env/apps/*.sh; do . "$file"; done

# load untracked files ;)
if [ -f ~/.secrets.sh ]; then . ~/.secrets.sh; fi
if [ -f ~/.work.sh ]; then . ~/.work.sh; fi

echo "🌲🌲🌲  ${NICKNAME:=$USER} // $OS $VER $BITS-bit ($ARCTCTR) 🌲🌲🌲"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
