#!/bin/bash
if ! command_exists kubectl;
then
  add_brew_install "kubernetes-cli"
fi
