#!/bin/bash
export RUST_BACKTRACE=1

# setting PATH as the before calling .cargo/env is significant.
export PATH="$HOME/.cargo/bin:$PATH"
# cargo wants us to do this. really, it should no op in its current form, but
# we call it for safety anyway :)
. "$HOME/.cargo/env"

function rustify() {
  if [ -f "$HOME/.cargo/env" ]; then
    . $HOME/.cargo/env
    # https://github.com/rust-unofficial/awesome-rust#productivity
    global_crates=("zoxide" "bat" "bandwhich" "cargo-edit" "click") #  "dust"

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

alias clippyfix="cargo clippy --fix --allow-staged --allow-dirty"
