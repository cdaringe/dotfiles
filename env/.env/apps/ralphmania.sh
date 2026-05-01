# shellcheck shell=bash
function ralphm() {
  PLUGINFILE="./plugin.ralph.ts"
  PLUGINPARAM=""
  if [[ -f "$PLUGINFILE" ]]; then
    PLUGINPARAM="--plugin $PLUGINFILE"
  fi
  deno run -A jsr:@cdaringe/ralphmania -i 30 "$PLUGINPARAM" "$@"
}
