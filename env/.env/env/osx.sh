#!/bin/bash
if [ "$IS_DARWIN" ]; then
  alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
  alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
  adduser () {
    sudo dseditgroup -o edit -a "$1" -t user "$2"
  }
  alias git=hub
fi
