if [ "$(cat /sys/class/power_supply/ACAD/online)" -eq 0 ]; then 
  swaylock --screenshot
fi
