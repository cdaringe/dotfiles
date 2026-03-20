#!/bin/bash
. ~/.basher.sh


# fnm
FNM_PATH="/home/cdaringe/.fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/cdaringe/.lmstudio/bin"
# End of LM Studio CLI section

