#!/bin/sh

# Path to battery information
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Read battery percentage and status
if [ -d "$BATTERY_PATH" ]; then
    CAPACITY=$(cat "$BATTERY_PATH/capacity") # Battery percentage
    STATUS=$(cat "$BATTERY_PATH/status")    # Charging status

    # Display appropriate icon and status
    if [ "$STATUS" = "Charging" ]; then
        printf "🔋 %s%% ⚡\n" "$CAPACITY"
    else
        printf "🔋 %s%%\n" "$CAPACITY"
    fi
else
    # No battery detected
    printf ""
fi
