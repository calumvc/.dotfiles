#!/bin/bash
/usr/bin/gcalcli agenda "today" "2 weeks" --details location | /usr/bin/sed "s/Location: /\x1b[0;32m      /g" > ~/.gcal_cache

# 0 * * * * /bin/bash /home/cal/.config/scripts/gcal.sh
