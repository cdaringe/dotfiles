#!/bin/bash

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
  # enable tab-style completions
  [[ $- = *i* ]] && bind TAB:menu-complete
fi

# osx, brew install bash-completion
if [[ $(type -P "brew") ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

export CLICOLOR=1
force_color_prompt=yes
color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

IS_LINUX=$(if [[ $OSTYPE == *"linux"* ]]; then echo 1; fi;)

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
export PS1="\W \\$ \[$(tput sgr0)\]"
if [ $IS_LINUX ]; then
  PS1='🌲 ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

LANG="en_US.UTF-8"
export LANG

# Commands to be executed before the prompt is displayed
# Save current working dir
if [ $IS_LINUX ]; then
  PROMPT_COMMAND='pwd > "${XDG_RUNTIME_DIR}/.cwd"'
  # Change to saved working dir
  [[ -f "${XDG_RUNTIME_DIR}/.cwd" ]] && cd "$(< ${XDG_RUNTIME_DIR}/.cwd)"
fi
