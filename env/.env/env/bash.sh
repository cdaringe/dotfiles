#!/bin/bash
# shellcheck shell=bash
theme() {
  local text="$1" color="$2" weight="${3:-}"
  [[ "$weight" == bold ]] && printf '%s' "$(tput bold)"
  [[ -n "$color" ]] && printf '%s' "$(tput setaf "$color")"
  printf '%s%s' "$text" "$(tput sgr0)"
}

function __set_title_to_command {
  # Don't set for shell builtins or empty lines
  [[ -z "$BASH_COMMAND" ]] && return
  [[ "$BASH_COMMAND" == *__systemd_* ]] && return
  case "$BASH_COMMAND" in
    __*|*033*|*PROMPT_COMMAND*|trap*|printf*|echo*) return ;;
    "") return ;;
  esac
  local cmd="${BASH_COMMAND%% *}"  # get the first word
  case "$cmd" in
    ls|cd|pwd|clear) return ;;
  esac
  printf '\033]0;▶ %s\007' "$cmd"
}

function __reset_terminal_title {
  printf '\033]0;%s\007' "$PWD"
}

# Set traps
trap '__set_title_to_command' DEBUG
PROMPT_COMMAND=__reset_terminal_title



# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
ts "checkwinsize"
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
#shopt -s cdspell

ts "/etc/bash_completion"
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  # shellcheck disable=SC1091
  . /etc/bash_completion
  # enable tab-style completions
  [[ $- = *i* ]] && bind TAB:menu-complete
fi

export CLICOLOR=1

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  ts "dir colors"
  # shellcheck disable=SC2015
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
fi

IS_LINUX=$(if [[ $OSTYPE == *"linux"* ]]; then echo 1; fi)
export IS_LINUX
IS_DARWIN=$(if [[ $OSTYPE == *"darwin"* ]]; then echo 1; fi)
export IS_DARWIN

# ts "load_iterm_integrations"
# test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

LANG="en_US.UTF-8"
export LANG
export BASH_SILENCE_DEPRECATION_WARNING=1

if hash starship 2>/dev/null; then
  eval "$(starship init bash)"
fi

confirm() {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? } [yN] " response
  case $response in
  [yY][eE][sS] | [yY])
    true
    ;;
  *)
    false
    ;;
  esac
}

# PROMPT_COMMAND='echo -ne "\033]0;${BASH_COMMAND:-}\007"'

function shutdown() {
  while true; do
    # shellcheck disable=SC2162
    read -p "Do you wish to shutdown host: $(hostname)? [yn]" yn
    case $yn in
    [Yy]*)
      $(which shutdown) "$@"
      return 0
      ;;
    [Nn]*) return 1 ;;
    *) echo "Please answer yes or no." ;;
    esac
  done
}

# unix generic
alias network='sudo $EDITOR /etc/network/interfaces'
alias powerdown="sudo shutdown -hP -t 1 now"

alias dusimple="du -d 1 -h"
if command -v eza &>/dev/null; then
  alias ls="eza"
elif command -v exa &>/dev/null; then
  alias ls="exa"
fi

HOSTNAME='?'
if command_exists "hostname"; then
  HOSTNAME="$(hostname)"
  export HOSTNAME
fi

# https://robotmoon.com/bash-prompt-generator/
# shellcheck disable=SC2016
PS1="🌲 $(theme '\u' 34 bold)$(theme '@' 40)$(theme '$HOSTNAME' 46) $(theme '\w' 154 bold) "
export PS1
# if [ "$IS_LINUX" ]; then
  # PS1='🌲 ${HOSTNAME:-}/\[\033[01;32m\]\u:\[\033[01;34m\]\w\[\033[00m\]\$ '
# fi

function trim_line() {
  xargs printf "%s\n" "$@"
}

# Pretty print $PATH to shell
function ppath() {
  echo "$PATH" | tr ":" "\n"
}

function dotenv() {
  # shellcheck disable=SC2046
  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}

run_times() {
  local num_times
  if [[ $# -lt 3 || "$2" != "--" ]]; then
    echo "Usage: run_times NUM_TIMES -- COMMAND [ARGS...]"
    return 1
  fi
  num_times=$1
  shift 2
  for ((i=1; i<=num_times; i++)); do
    "$@"
  done
}


run_times_count() {
  local num_times success=0 fail=0
  if [[ $# -lt 3 || "$2" != "--" ]]; then
    echo "Usage: run_times NUM_TIMES -- COMMAND [ARGS...]"
    return 1
  fi
  num_times=$1
  shift 2
  for ((i=1; i<=num_times; i++)); do

    if "$@"; then
      ((success++))
    else
      ((fail++))
    fi
  done
  echo "Success: $success"
  echo "Failed: $fail"
}

# disable bracketed paste
if [[ $- == *i* ]]; then
  bind 'set enable-bracketed-paste off'
  printf '\e[?2004l'
fi
