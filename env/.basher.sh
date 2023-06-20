#!/bin/bash
. $HOME/.env/dotfiles_util.sh

[ -z "$PS1" ] && return

ts "load_/etc/bashrc"
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

# bash specific aliases
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# load all env, apps, & aliases files
. ~/.env/apps_pre.sh

## env
for file in ~/.env/env/*.sh; do
  ts "load_env_$file"
  . "$file"
done

# ## apps
for file in ~/.env/apps/*.sh; do
  ts "load_apps_$file"
  . "$file"
done

# # load untracked files ;)
ts "load_secrets"
if [ -f ~/.secrets.sh ]; then . ~/.secrets.sh; fi
ts "load_work"
if [ -f ~/.work.sh ]; then . ~/.work.sh; fi

ts "env_post"
. $HOME/.env/env_post.sh
ts "apps_app"
. $HOME/.env/apps_post.sh

ts "done"
tsflush

# echo 🌲
