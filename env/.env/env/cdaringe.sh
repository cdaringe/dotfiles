#!/bin/bash
BLOG_DIR="$HOME/src/blog"
function blog() {
  if ! test -d "$BLOG_DIR"
  then
    git clone git@github.com:cdaringe/blog "$BLOG_DIR"
  fi
  cd $BLOG_DIR
  if ! test command pnpm &> /dev/null
  then
    npm install --global pnpm
  fi
  pnpm install
  cd "$BLOG_DIR"
  code "$BLOG_DIR"
  pnpm start
}
