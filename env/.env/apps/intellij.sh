#!/usr/env/bin bash
if [ $IS_DARWIN ]; then
  function idea() {
    open -na "IntelliJ IDEA.app" --args "$@"
  }
fi
