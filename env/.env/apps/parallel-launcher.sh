#!/bin/bash
function parallel_launcher() {
  nix run nixpkgs#parallel-launcher -- "$@"
}