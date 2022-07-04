#!/bin/bash
cd() {
  builtin cd "$@";
  'load_nvmrc';
}
