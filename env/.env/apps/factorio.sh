#!/usr/bin/env bash

export FACTORIO_HOME="~/Library/Application\ Support/Steam/steamapps/common/Factorio/factorio.app/Contents"
function factorio_sync () {
  echo "⚙️ pulling factorio mods using user $FACTORIO_USER"
  scp -r $FACTORIO_USER@$DROPLET_IP:/www/factorio/mods/* ~/factorio/mods/
  echo "⚙️ pushing factorio mods using user $FACTORIO_USER"
  scp -r ~/factorio/mods/* $FACTORIO_USER@$DROPLET_IP:/www/factorio/mods/
}
