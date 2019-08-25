#!/bin/bash
if [ -f /etc/bashrc ]; then . /etc/bashrc; fi
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
