#!/bin/bash
function movToGif() {
  `ffmpeg -i $1 -pix_fmt rgb24 -r 5 -f gif - | gifsicle --optimize=4 --delay=20 > $1.gif`;
}

alias file_server="deno \
  https://deno.land/x/net/file_server.ts --allow-net"
