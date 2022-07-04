#!/bin/bash
function brew_install_all () {
  for app in "${brew_to_install[@]}"
  do
    if ! command_exists "$app";
    then
      echo ":: Installing $app"
      brew install -f "$app"
    fi
  done
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew_install_all || true
fi
