#!/bin/bash
. ~/.basher.sh

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
if [ -e /Users/cdaringe/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/cdaringe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
