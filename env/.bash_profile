#!/bin/bash
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

export BASH_SILENCE_DEPRECATION_WARNING=1
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.cargo/bin:$PATH"
