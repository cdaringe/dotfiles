#!/bin/bash
function brew_install_all() {
  if command_exists node; then
    local current_pwd="$PWD"
    cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
    node ./apps_post.js "${brew_to_install[@]}"
    cd "$current_pwd" || exit
  else
    echo "@warning - install node.js ASAP to auto install brew deps"
  fi
}

function brew_install_all_cask() {
  for app in "${brew_to_install_cask[@]}"; do
    echo "checking $app"
    # check if cask app name is present
    if ! brew list "$app" &>/dev/null; then
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
  if ! command_exists code; then
    echo "warning: cask for 'code' not found. do you need to run 'brew_install_all_cask'?"
  fi
fi
