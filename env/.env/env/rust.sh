#!/bin/bash
export PATH="$HOME/.cargo/bin:$PATH"
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

  alias z=zoxide
  # eval "$(zoxide init bash)"
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
