#!/bin/bash

# Get brew executables on PATH immediately
export PATH="/opt/homebrew/bin/:$PATH"

brew_to_install=("hub" "tree" "jq" "ffmpeg")
brew_to_install_cask=("caffeine" "flux" "flycut" "spectacle" "iterm2" "docker" "visual-studio-code" "evernote" "wireshark" "bloomrpc")
function add_brew_install() {
  brew_to_install+=("$1")
}
function add_brew_install_cask() {
  brew_to_install_cask+=("$1")
}
