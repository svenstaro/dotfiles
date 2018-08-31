#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	export MONITOR=$m

    if xrandr --query | grep "primary" | grep -q "$m"; then
		export TRAY_POS=right
	else
		export TRAY_POS=""
	fi
	polybar --reload example &
    sleep 1
done
