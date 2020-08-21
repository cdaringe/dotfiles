#!/bin/bash
if hash yarn 2>/dev/null; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
# yearning for speeeeed
alias yearn="yarn --prefer-offline --ignore-scripts --ignore-optional"
