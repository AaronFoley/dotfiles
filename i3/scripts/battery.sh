#!/bin/bash

CAPACITY=`cat /sys/class/power_supply/BAT0/capacity`
STATUS=`cat /sys/class/power_supply/BAT0/status`

ICON=''

if [ "$STATUS" != "Discharging" ]; then
    ICON=''
elif [ "$CAPACITY" -gt "75" ]; then
    ICON=''
elif [ "$CAPACITY" -gt "50" ]; then
    ICON=''
elif [ "$CAPACITY" -gt "25" ]; then
    ICON=''
else
    ICON=''
fi

echo "$ICON $CAPACITY"
