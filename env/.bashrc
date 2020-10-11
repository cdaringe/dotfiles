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
for file in ~/.env/env/*.sh; do
  ts "load_env_$file"
  . "$file"
done
for file in ~/.env/aliases/*.sh; do
  ts "load_aliases_$file"
  . "$file";
done
for file in ~/.env/apps/*.sh; do
  ts "load_apps_$file"
  . "$file";
done

# load untracked files ;)
ts "load_secrets"
if [ -f ~/.secrets.sh ]; then . ~/.secrets.sh; fi
ts "load_work"
if [ -f ~/.work.sh ]; then . ~/.work.sh; fi

# echo "🌲🌲🌲  ${NICKNAME:=$USER} // $OS $VER $BITS-bit ($ARCTCTR) 🌲🌲🌲"
echo 🌲

PATH="/Users/cdaringe/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/cdaringe/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/cdaringe/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/cdaringe/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/cdaringe/perl5"; export PERL_MM_OPT;
