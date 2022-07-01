#!/usr/env/bin bash
add_brew_install "ncdu"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
