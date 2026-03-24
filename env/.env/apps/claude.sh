#!/usr/env/bin bash
function claudec() {
  claude "$@" 'Read ~/agents/code.md. Traverse the guidelines lazily when your task topics match.'
}
function dc() {
  claudec  --dangerously-skip-permissions "$@"
}
