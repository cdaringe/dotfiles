#!/usr/env/bin bash
# shellcheck shell=bash
if [ "$IS_DARWIN" ]; then
  alias chromewithdebuglogging="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --enable-logging --v=1"
  # shellcheck disable=SC2155
  export CHROME_LOGS_FILENAME="/Users/$(whoami)/Library/Application\ Support/Google/Chrome/chrome_debug.log"
  # shellcheck disable=SC2139
  alias chromelogs="echo '$CHROME_LOGS_FILENAME'"
fi
