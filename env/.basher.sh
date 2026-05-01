#!/bin/bash
# shellcheck shell=bash

# shellcheck disable=SC1091
. "$HOME"/.env/dotfiles_util.sh

[ -z "$PS1" ] && return

ts "load_/etc/bashrc"
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

# bash specific aliases
if [ -f ~/.bash_aliases ]; then . "$HOME"/.bash_aliases; fi

# load all env, apps, & aliases files
. "$HOME"/.env/apps_pre.sh

## env
for file in "$HOME"/.env/env/*.sh; do
  ts "load_env_$file"
  # shellcheck disable=SC1090
  . "$file"
done

# ## apps
for file in ~/.env/apps/*.sh; do
  ts "load_apps_$file"
  # shellcheck disable=SC1090
  . "$file"
done

# # load untracked files ;)
ts "load_secrets"
if [ -f ~/.secrets.sh ]; then . "$HOME"/.secrets.sh; fi
ts "load_work"
if [ -f ~/.work.sh ]; then . "$HOME"/.work.sh; fi

ts "env_post"
. "$HOME"/.env/env_post.sh
ts "apps_app"
. "$HOME"/.env/apps_post.sh

ts "done"
tsflush

# echo 🌲
