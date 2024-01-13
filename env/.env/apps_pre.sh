#!/bin/bash

# Get brew executables on PATH immediately
export PATH="/opt/homebrew/bin/:$PATH"

# See apps_post.js for syntax
brew_to_install=("bash" "dot::graphviz" "hub" "tree" "nmap" "jq" "ffmpeg" "jtd-codegen::jsontypedef/jsontypedef/jtd-codegen" "sonar-scanner")
brew_to_install_cask=("caffeine" "obs" "flux" "flycut" "github" "rectangle" "iterm2" "visual-studio-code" "wireshark" "bloomrpc" "podman-desktop")
function add_brew_install() {
  brew_to_install+=("$1")
}
function add_brew_install_cask() {
  brew_to_install_cask+=("$1")
}
