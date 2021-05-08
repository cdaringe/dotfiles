#!/bin/bash
BLOG_DIR="$HOME/src/blog"
function blog() {
  if ! test -d "$BLOG_DIR"
  then
    git clone git@github.com:cdaringe/blog "$BLOG_DIR"
  fi
  cd $BLOG_DIR
  # gatsby not pnpm compatible :/
  # if ! test command pnpm &> /dev/null
  # then
  #   npm install --global pnpm
  # fi
  yarn
  cd "$BLOG_DIR"
  code "$BLOG_DIR"
  yarn start
}
