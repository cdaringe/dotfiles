#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi
