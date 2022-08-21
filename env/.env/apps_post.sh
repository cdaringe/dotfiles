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
      brew install --cask "$app"
    fi
  done
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  brew_install_all || true
  # use code as a key indicator if casks are missing.
  # checking for cask presence is _slow_, so we cannot do it on shell
  # init
  if ! command_exists code;
  then
    echo "warning: cask for 'code' not found. do you need to run 'brew_install_all_cask'?"
  fi
fi
