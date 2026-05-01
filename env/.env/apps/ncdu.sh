#!/usr/env/bin bash
# shellcheck shell=bash
add_brew_install "ncdu"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
