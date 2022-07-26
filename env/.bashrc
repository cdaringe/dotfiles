#!/bin/bash
. ~/.basher.sh

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true
#sledge:binary path
export SLEDGE_BIN=/Users/c0d01a5/.sledge/bin
export PATH="${PATH}:${SLEDGE_BIN}"
