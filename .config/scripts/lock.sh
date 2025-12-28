if [ "$(cat /sys/class/power_supply/ACAD/online)" -eq 0 ]; then 
  sleep .5; swaylock --screenshot
fi
