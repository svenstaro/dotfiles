#!/bin/bash

battery_found=false
battery_charging=false

for battery in /sys/class/power_supply/BAT*; do
  if [[ -f "$battery/uevent" ]]; then
    battery_found=true
    if [[ $(head -1 /sys/class/power_supply/BAT*/status) == "Charging" ]]; then
      battery_charging=true
    fi
    break
  fi
done

if [[ $battery_found == false ]]; then
  exit 0
fi

battery_remaining=$(head -1 /sys/class/power_supply/*/capacity)

if [[ $battery_charging == true ]]; then
  color=#ebdbb2
else
  if (( battery_remaining <= 15 )); then
    color="#cc241d"
  else
    color="#fabd2f"
  fi
fi

battery_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰁹")
charging_icon="󰂄"

icon_index=$((battery_remaining / 10))
battery_icon=${battery_icons[icon_index]}

if [[ $battery_charging == true ]]; then
  battery_icon=$charging_icon
fi

echo "<span foreground=\"$color\">$battery_remaining% $battery_icon</span>"
