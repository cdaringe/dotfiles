#!/bin/bash

# Get brew executables on PATH immediately
export PATH="/opt/homebrew/bin/:$PATH"

brew_to_install=()
function add_brew_install () {
  brew_to_install+=("$1")
}
