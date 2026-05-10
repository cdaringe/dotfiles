#!/usr/bin/env bash
# shellcheck shell=bash
if command_exists bat; then
  alias cat='bat'
fi
#BAT_CONFIG_DIR="$(bat cache --config-dir)"
