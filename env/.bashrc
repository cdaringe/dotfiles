#!/bin/bash
. ~/.basher.sh


# fnm
FNM_PATH="/home/cdaringe/.fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
