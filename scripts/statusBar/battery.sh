#!/bin/sh

BATTERY=$(find /sys/class/power_supply -name "BAT*" | head -n 1)

# Check if a battery directory is found
if [ -z "$BATTERY" ]; then
    exit 1
fi

STATUS=$(cat "$BATTERY/status")
CAPACITY=$(cat "$BATTERY/capacity")

ICON=""
case "$STATUS" in
    "Full") ICON="󱟢";;
    "Discharging") 
        if [ $CAPACITY -lt 10 ]; then ICON="󰂎";
        elif [ $CAPACITY -lt 20 ]; then ICON="󰁺";
        elif [ $CAPACITY -lt 30 ]; then ICON="󰁻";
        elif [ $CAPACITY -lt 40 ]; then ICON="󰁼";
        elif [ $CAPACITY -lt 50 ]; then ICON="󰁽";
        elif [ $CAPACITY -lt 60 ]; then ICON="󰁾";
        elif [ $CAPACITY -lt 70 ]; then ICON="󰁿";
        elif [ $CAPACITY -lt 80 ]; then ICON="󰂀";
        elif [ $CAPACITY -lt 90 ]; then ICON="󰂁";
        elif [ $CAPACITY -lt 100 ]; then ICON="󰂂";
        else ICON="󰁹"; fi;;
    "Charging") 
        if [ $CAPACITY -lt 10 ]; then ICON="󰢟";
        elif [ $CAPACITY -lt 20 ]; then ICON="󰢜";
        elif [ $CAPACITY -lt 30 ]; then ICON="󰂆";
        elif [ $CAPACITY -lt 40 ]; then ICON="󰂇";
        elif [ $CAPACITY -lt 50 ]; then ICON="󰂈";
        elif [ $CAPACITY -lt 60 ]; then ICON="󰢝";
        elif [ $CAPACITY -lt 70 ]; then ICON="󰂉";
        elif [ $CAPACITY -lt 80 ]; then ICON="󰢞";
        elif [ $CAPACITY -lt 90 ]; then ICON="󰂊";
        elif [ $CAPACITY -lt 100 ]; then ICON="󰂋";
        else ICON="󰂅"; fi;;
esac
printf "<\x05%s  %s%%" "$ICON" "$CAPACITY"
