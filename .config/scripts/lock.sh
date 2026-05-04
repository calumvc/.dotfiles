#!/bin/bash
if [ "$(cat /sys/class/power_supply/ACAD/online)" -eq 0 ]; then 
  sleep 1.5; hyprlock
fi
