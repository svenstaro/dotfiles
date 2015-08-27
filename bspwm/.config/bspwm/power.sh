#!/bin/bash

set -e

while [[ true ]]; do
    format=$1

    energy_sum=0
    energy_full_sum=0

    # Only one of the batteries is being drained/charged at a time, so we'll have to go through
    # all of them and figure out which it is
    power_now=0

    remaining=0
    status="Unknown"

    for battery in /sys/class/power_supply/BAT*; do
        if [[ $(cat ${battery}/present) -eq 1 ]]; then
            [[ $(cat ${battery}/status) == "Charging" ]] && status="Charging"
            [[ $(cat ${battery}/status) == "Discharging" ]] && status="Discharging"
            
            energy_sum=$(( ${energy_sum} + $(cat ${battery}/energy_now) ))
            energy_full_sum=$(( ${energy_full_sum} + $(cat ${battery}/energy_full) ))

            pnow=$(cat ${battery}/power_now)
            if [[ ${pnow} -ne 0 ]]; then
                power_now=$(( ${pnow} ))
            fi
        fi
    done

    if [[ ${status} == "Unknown" ]]; then
        status="Charged"
    else
        if [[ ${status} == "Charging" ]]; then
            remaining=$(( (${energy_full_sum} - ${energy_sum}) * 60 / ${power_now} ))
        elif [[ ${status} == "Discharging" ]]; then
            remaining=$(( ${energy_sum} * 60 / ${power_now} ))
        fi
        remaining_hours=$(( ${remaining} / 60 ))
        remaining_minutes=$(( ${remaining} % 60 ))
        remaining_minutes=$(printf "%02d" ${remaining_minutes})
        formatted_power=$(( ${power_now} / 1000000)).$(( ${power_now} % 1000000 / 10000 ))
    fi

    if [[ -n ${format} ]]; then
        [[ ${format} == *"%s"* ]] && format=${format/"%s"/${status}}
        [[ ${format} == *"%p"* ]] && format=${format/"%p"/${formatted_power}}
        [[ ${format} == *"%h"* ]] && format=${format/"%h"/${remaining_hours}}
        [[ ${format} == *"%m"* ]] && format=${format/"%m"/${remaining_minutes}}
        echo "${format}"
    else
        echo "${status} ${remaining_hours}:${remaining_minutes}h ${formatted_power}W"
    fi

    sleep 5
done
