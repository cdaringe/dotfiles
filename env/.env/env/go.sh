#!/bin/bash
if ! command_exists go; then
  if [ $IS_DARWIN ]; then
    if [ -f /opt/homebrew/opt/go ]; then
      export GOPATH=$HOME/go
      export GOROOT="$(/opt/homebrew/opt/go)"
      export PATH=$PATH:$GOPATH/bin
    fi
  fi
fi
