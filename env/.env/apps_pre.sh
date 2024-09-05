#!/bin/bash

# Get brew executables on PATH immediately
export PATH="/opt/homebrew/bin/:$PATH"

# See apps_post.js for syntax
brew_to_install=("bash" "fd" "hub" "tree" "jq" "mosh" "ffmpeg" "podman")
# openlens - manually install @alebcay/openlens-node-pod-menu, (optional, maybe) @andrea-falco/lens-multi-pod-logs
brew_to_install_cask=("obs" "flux" "flycut" "rectangle" "iterm2" "visual-studio-code" "wireshark" "podman-desktop" "openlens")
function add_brew_install() {
  brew_to_install+=("$1")
}
function add_brew_install_cask() {
  brew_to_install_cask+=("$1")
}
