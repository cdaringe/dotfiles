#!/bin/bash
# cool, but slow.

# ts "get arch"
# export ARCTCTR=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

# ts "get lsb version"
# if [ -f /etc/lsb-release ]; then
#   . /etc/lsb-release
#   OS=$DISTRIB_ID
#   VER=$DISTRIB_RELEASE
# elif [ -f /etc/debian_version ]; then
#   OS="ubuntu"  # XXX or Ubuntu??
#   VER=$(cat /etc/debian_version)
# elif [ -f /etc/yum.conf ]; then
#   OS=centos
#   VER=crappy-version
# elif [ -f /bin/pacman ]; then
#   OS="arch"
#     VER="?"
# else
#   OS=$(uname -s)
#   VER=$(uname -r)
# fi

# case $(uname -m) in
# x86_64)
#   BITS=64
#   ;;
# i*86)
#   BITS=32
#   ;;
# *)
#   BITS=?
#   ;;
# esac


function ,indianajonesswap () {
  SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
  node "$SCRIPT_DIR/system.js" indianajonesswap "$@"
}