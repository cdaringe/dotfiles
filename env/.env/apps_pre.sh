#!/bin/bash

# Get brew executables on PATH immediately
export PATH="/opt/homebrew/bin/:$PATH"

# See apps_post.js for syntax
brew_to_install=("bash" "hub" "tree" "nmap" "jq" "ffmpeg" "jtd-codegen::jsontypedef/jsontypedef/jtd-codegen")
brew_to_install_cask=("caffeine" "flux" "flycut" "github" "spectacle" "iterm2" "docker" "visual-studio-code" "wireshark" "bloomrpc")
function add_brew_install() {
  brew_to_install+=("$1")
}
function add_brew_install_cask() {
  brew_to_install_cask+=("$1")
}
