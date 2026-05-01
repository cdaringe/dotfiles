#!/usr/bin/env bash
# rm -f .profile .bashrc
git config core.hooksPath .githooks
stow env "$@"
