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

function brew_install_all_cask () {
  for app in "${brew_to_install_cask[@]}"
  do
    echo "checking $app"
    if ! brew list "$app" &>/dev/null;
    then
      echo ":: Installing $app"
      brew install "$app"
    fi
  done
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew_install_all || true
  if ! command_exists code;
  then
    echo "warning: cask for 'code' not found. do you need to run 'brew_install_all_cask'?"
  fi
fi
