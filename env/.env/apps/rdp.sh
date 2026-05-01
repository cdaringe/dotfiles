# shellcheck shell=bash
if command_exists sdl-freerdp; then
  # sdl-freerdp /v:$TARGET /u:$USER /f /dynamic-resolution /gfx /clipboard
  alias rdp='sdl-freerdp'
fi
