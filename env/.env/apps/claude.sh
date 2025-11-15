#!/usr/env/bin bash
function claudec() {
  claude "$@" 'Read ~/agents/agents.md. Traverse the guidelines lazily when your task topics match.'
}
function claudedangerous() {
  claudec  --dangerously-skip-permissions "$@"
}
