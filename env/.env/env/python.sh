#!/bin/bash
export PIPENV_VENV_IN_PROJECT=1
export PYTHON_DEV=1
if ! command_exists python; then
  if command_exists python3; then
    echo "linking python3 as python to /usr/local/bin"
    ln -s "$(which python3)" /usr/local/bin/python
  fi
fi
