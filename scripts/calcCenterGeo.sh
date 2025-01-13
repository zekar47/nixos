#!/bin/sh

# Ensure the user provides a width and height
if [ $# -ne 2 ]; then
    echo "Usage: $0 <width> <height>"
    exit 1
fi

# Input: width and height
width="$1"
height="$2"

# Get the screen's width and height using `xdpyinfo`
screen_res=$(xrandr | grep -w connected | awk '{print $3}' | cut -d+ -f1 | sed "s/x/\ /")
screen_width=$(echo "$screen_res" | awk "{print \$1}")
screen_height=$(echo "$screen_res" | awk "{print \$2}")

# Calculate offsets (center the window by default)
xoff=$(((screen_width - width)/2))
yoff=$(((screen_height - height)/2))

# Ensure offsets are not negative (in case the window is larger than the screen)
if [ "$xoff" -lt 0 ]; then
    xoff=0
fi

if [ "$yoff" -lt 0 ]; then
    yoff=0
fi

# Output the calculated geometry in the format: width x height + x_offset + y_offset
echo "${width}x${height}+${xoff}+${yoff}"
