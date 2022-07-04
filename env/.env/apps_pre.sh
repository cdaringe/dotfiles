#!/bin/bash
brew_to_install=()
function add_brew_install () {
  brew_to_install+=("$1")
}
