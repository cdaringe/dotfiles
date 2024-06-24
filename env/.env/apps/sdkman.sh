#!/bin/bash
if [ $IS_DARWIN ]; then
  function sdk() {
    echo "this doesn't work anymore, need to fixup sdkman.sh"
    if !command_exists sdk; then
      export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
      [[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
    fi
  }
fi
