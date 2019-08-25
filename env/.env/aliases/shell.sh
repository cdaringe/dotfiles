#!/usr/bin/env bash

confirm () {
  # call with a prompt string or use a default
  read -r -p "${1:-Are you sure? } [yN] " response
  case $response in
    [yY][eE][sS]|[yY])
      true
      ;;
    *)
      false
      ;;
  esac
}

function shutdown() {
  while true; do
    read -p "Do you wish to shutdown host: $(hostname)? [yn]" yn
    case $yn in
      [Yy]*)
        $(which shutdown) $@
        return 0;;
      [Nn]*) return 1;;
      *) echo "Please answer yes or no.";;
    esac
  done
}

# unix generic
alias network="sudo $EDITOR /etc/network/interfaces"
alias powerdown="sudo shutdown -hP -t 1 now"

alias dusimple="du -d 1 -h"
[ -x /usr/local/bin/exa ] && alias ls="exa"
