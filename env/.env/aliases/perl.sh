#!/bin/bash
function perlbrew () {
  unset -f perlbrew
  source ~/perl5/perlbrew/etc/bashrc
  perlbrew "$@"
}
