#!/bin/bash
add_brew_install "fnm"

# macos default
FNM_PATH="$HOME/.fnm/fnm"

# 
if [ $IS_LINUX ]; then
  FNM_PATH="$HOME/.local/share/fnm"
fi

if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
