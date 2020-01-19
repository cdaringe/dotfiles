# if [[ type -v fdfind ]]; then
#   alias fd=fdfind
# fi
command -v fd >/dev/null 2>&1 || { alias fd=fdfind; }
