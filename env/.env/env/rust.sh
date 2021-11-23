#!/bin/bash
export PATH="$HOME/.cargo/bin:$PATH"
function rustify () {
  if [ -f "$HOME/.cargo/env" ]; then
    . $HOME/.cargo/env
    # https://github.com/rust-unofficial/awesome-rust#productivity
    global_crates=("zoxide" "bat" "fd" "bandwhich") #  "dust"

    function upsertGlobalCrate () {
      if [ ! $(command -v $1) ]; then
        cargo install "$1" -f
      fi
    }
    for crate in "${global_crates[@]}"; do
      # echo upserting crate $crate
      upsertGlobalCrate $crate
    done
  fi

}
