#!/usr/bin/env bash
export NAS_IP=192.168.1.10
function bignas() {
  # shellcheck disable=SC2029
  ssh "$NAS_IP" "$@"
}
