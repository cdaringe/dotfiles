#!/bin/bash
if [ $IS_DARWIN ]; then
  if ! command_exists ag; then
    add_brew_install "the_silver_searcher"
  fi
fi
