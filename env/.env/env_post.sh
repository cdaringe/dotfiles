#!/bin/bash
cd() {
  # shellcheck disable=SC2164
  builtin cd "$@";
  'load_nvmrc';
}
