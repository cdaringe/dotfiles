#!/bin/bash
function fdhelp() {
  echo "Examples: Find all TypeScript declaration files and print command to delete them"
  echo "fd --extension=d.ts -Hu . 'src/' -x rm {}"
  echo "fd --extension=d.ts -Hu . 'src/' -x echo {}"
  echo "Reminder of critical flags:"
  echo " -H: hidden files"
  echo " -u: untracked files (git)"
  echo " -x: execute command on found files"
}
