#!/bin/bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias showhidden="defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder"
  alias hidehidden="defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder"
  alias dsoff="defaults write com.apple.desktopservices DSDontWriteNetworkStores true"
  alias dson="defaults write com.apple.desktopservices DSDontWriteNetworkStores false"
  adduser () {
    sudo dseditgroup -o edit -a $1 -t user $2
  }
  alias git=hub
  # https://github.com/jart/cosmopolitan#macos
  alias gcc="x86_64-elf-gcc"
  alias objcopy="x86_64-elf-objcopy"
fi
