#!/bin/bash
export PIPENV_VENV_IN_PROJECT=1
export PYTHON_DEV=1
if ! command_exists python; then
  if command_exists python3; then
    # export PATH="$(which python3):$PATH"
    alias python=python3
  fi
fi
