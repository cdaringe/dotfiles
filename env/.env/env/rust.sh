#!/bin/bash
export PATH="$HOME/.cargo/bin:$PATH"
if [ -f "$HOME/.cargo/env" ]; then
  . $HOME/.cargo/env
  export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/

  # https://github.com/rust-unofficial/awesome-rust#productivity
  global_crates=("zoxide" "bat" "fd" "bandwhich") #  "dust"

  function upsertGlobalCrate () {
    if [ ! $(command -v $1) ]; then
      cargo install "$1" -f
    fi
  }
  for crate in ${global_crates[@]}; do
    # echo upserting crate $crate
    upsertGlobalCrate $crate
  done

  alias z=zoxide
  # eval "$(zoxide init bash)"
fi
