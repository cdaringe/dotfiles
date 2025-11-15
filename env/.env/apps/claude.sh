#!/usr/env/bin bash
function claudedangerous() {
  claude -p 'Read ~/agents/agents.md. Traverse the guidelines lazily when your task topics match.' --dangerously-skip-permissions "$@"
}
