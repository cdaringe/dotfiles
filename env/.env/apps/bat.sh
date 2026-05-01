#!/usr/env/bin bash
# shellcheck shell=bash
if [ "$IS_DARWIN" ]; then
  alias cat='bat'
fi
#BAT_CONFIG_DIR="$(bat cache --config-dir)"
