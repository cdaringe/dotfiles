# shellcheck shell=bash
if ! command_exists go; then
  if [ "$IS_DARWIN" ]; then
    if [ -f /opt/homebrew/opt/go ]; then
      export GOPATH=$HOME/go
      # shellcheck disable=SC2155
      export GOROOT="$(/opt/homebrew/opt/go)"
      export PATH=$PATH:$GOPATH/bin
    fi
  fi
fi
