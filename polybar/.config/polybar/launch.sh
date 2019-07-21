#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top on LCD panel
MONITOR=LVDS1 polybar top &

# Launch top on external monitor
if xrandr -q | grep -q "DP2 connected"; then
    MONITOR=DP2 polybar top &
fi
