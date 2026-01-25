#!/bin/bash
ACTIVE_PID=$(hyprctl activewindow -j | jq -r ".pid")

CWD=$(readlink /proc/$(pgrep -P $ACTIVE_PID | tail -n 1)/cwd)

if [ -z "$CWD" ]; then
  CWD=$HOME
fi

kitty --directory "$CWD"
