#!/bin/bash
. "$HOME/.cargo/env"
export RUST_BACKTRACE=1
export PATH="$HOME/.cargo/bin:$PATH"
function rustify() {
  if [ -f "$HOME/.cargo/env" ]; then
    . $HOME/.cargo/env
    # https://github.com/rust-unofficial/awesome-rust#productivity
    global_crates=("zoxide" "bat" "fd" "bandwhich" "cargo-edit" "click") #  "dust"

    function upsertGlobalCrate() {
      if [ ! $(command -v $1) ]; then
        echo "cargo installing: $1"
        cargo install "$1" -f
      fi
    }
    for crate in "${global_crates[@]}"; do
      # echo upserting crate $crate
      upsertGlobalCrate $crate
    done
  fi

}
