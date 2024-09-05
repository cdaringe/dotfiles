#!/bin/bash
if command_exists zig; then
  export CC="zig cc"
fi
