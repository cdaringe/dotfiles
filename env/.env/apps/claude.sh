#!/usr/env/bin bash
# shellcheck shell=bash
function claudec() {
  claude "$@" 'Read ~/agents/agents.md. Traverse the guidelines lazily when your task topics match.'
}
function dc() {
  claudec  --dangerously-skip-permissions "$@"
}
