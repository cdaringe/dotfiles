#!/bin/bash
export ARCTCTR=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

if [ -f /etc/lsb-release ]; then
  . /etc/lsb-release
  OS=$DISTRIB_ID
  VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
  OS="ubuntu"  # XXX or Ubuntu??
  VER=$(cat /etc/debian_version)
elif [ -f /etc/yum.conf ]; then
  OS=centos
  VER=crappy-version
elif [ -f /bin/pacman ]; then
  OS="arch"
    VER="?"
else
  OS=$(uname -s)
  VER=$(uname -r)
fi

case $(uname -m) in
x86_64)
  BITS=64
  ;;
i*86)
  BITS=32
  ;;
*)
  BITS=?
  ;;
esac

function install_the_world_apt () {
  sudo apt-get install \
    bat \
    curl \
    silversearcher-ag \
    stow \
    git \
    vim \
    tmux
  if [ ! -z nvm ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
  fi
  printf "remember to also:\n\tgit_upload_ssh_key\n\tballervim\n\tsync vscode settings"
  echo
}
