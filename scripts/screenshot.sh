#!/bin/sh

# Take a screenshot of the entire screen and pass it to feh using a pipe
maim | feh -F - &

# Use slop to get the selected area
geometry=$(slop -f "%x %y %w %h")

# # This failed fsr.
# Parse the geometry
# set -- "$geometry"
# X=$1
# Y=$2
# W=$3
# H=$4

read -r X Y W H <<EOF
$geometry
EOF

# Take a screenshot of the selected area and pipe it directly to xclip
maim -g "${W}x${H}+${X}+${Y}" | xclip -selection clipboard -t image/png

# Kill feh to remove the full screen overlay
pkill feh
