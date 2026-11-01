#!/bin/bash
# shellcheck shell=bash

alias install_agent_pi='npm install --global @earendil-works/pi-coding-agent@latest && pi update --extensions'
alias install_agent_codex='npm install --global @openai/codex@latest'
alias pi_settings="${EDITOR:-code} ~/.pi/agent/settings.json"