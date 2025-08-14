#!/bin/bash
export RUST_BACKTRACE=1

if [ -d "$HOME/.rustup" ]; then
  export PATH="$(brew --prefix rustup)/bin:$PATH"
fi

if [ -f "$HOME/.cargo/env" ]; then
    . $HOME/.cargo/env
fi

if [ -d "$HOME/.cargo/bin" ]; then
  # setting PATH as the before calling .cargo/env is significant.
  export PATH="$HOME/.cargo/bin:$PATH"

  # cargo wants us to do this. really, it should no op in its current form, but
  # we call it for safety anyway :)

  alias clippyfix="cargo clippy --fix --allow-staged --allow-dirty"
fi

function rustify() {

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
}
