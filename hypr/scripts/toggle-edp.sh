#!/bin/bash

if hyprctl monitors |grep "Monitor eDP-1" > /dev/null; then
    hyprctl keyword monitor "eDP-1, disable"
else
    hyprctl keyword monitor "eDP-1, highrr, auto, 1"
fi;
