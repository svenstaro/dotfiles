#!/bin/bash

if [[ $(hostname) == 'neo' ]]; then
    xrandr --dpi 96
elif [[ $(hostname) == 'dozer' ]]; then
    xrandr --dpi 144
fi
./fehbg
bspwm-session
