#!/usr/bin/env bash
if [ $OSTYPE = 'linux-gnu' ]; then
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
fi
