#!/bin/bash
if ! command_exists go; then
  export GOPATH=$HOME/go
  export GOROOT="$(/opt/homebrew/opt/go)"
  export PATH=$PATH:$GOPATH/bin
fi
