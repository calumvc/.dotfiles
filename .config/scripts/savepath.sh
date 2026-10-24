#!/bin/bash
ACTIVE_PID=$(hyprctl activewindow -j | jq -r ".pid")

CHILD_PID=$(for pid in $(pgrep -P "$ACTIVE_PID"); do
  [ "$(cat /proc/$pid/comm 2>/dev/null)" != "kitten" ] && echo "$pid"
done | tail -n 1)

CWD=$(readlink /proc/$CHILD_PID/cwd)

if [ -z "$CWD" ]; then
  CWD=$HOME
fi

kitty --directory "$CWD"
