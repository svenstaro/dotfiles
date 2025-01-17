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

remaining=$(head -1 /sys/class/power_supply/*/capacity)

if [[ $battery_charging == true ]]; then
  color="#689d6a"
else
  if (( remaining <= 15 )); then
    color="#cc241d"
  else
    color="#fabd2f"
  fi
fi

if (( remaining <= 15 )); then
  echo "<span foreground=\"$color\"></span>"
elif (( remaining > 15 && remaining <= 35 )); then
  echo "<span foreground=\"$color\"></span>"
elif (( remaining > 35 && remaining <= 55 )); then
  echo "<span foreground=\"$color\"></span>"
elif (( remaining > 55 && remaining <= 75 )); then
  echo "<span foreground=\"$color\"></span>"
elif (( remaining > 75 )); then
  echo "<span foreground=\"$color\"></span>"
fi
