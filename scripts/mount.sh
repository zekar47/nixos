#!/bin/sh
# Script to mount a device
# You need dmenu to run this.

# List block devices
lsblk -o NAME,MOUNTPOINT,LABEL,TYPE -lp |
grep -E "^\S+\s+([^\s/]+)\s+([^\s/]+)?\s+part$" |
awk '{$NF=""} 1' | while read -r line; do
  # Extract the device name and label.
  dev=$(echo "$line" | awk '{print $1}')
  label=$(echo "$line" | awk '{print $2}')

  # Ask the user whether to mount the devices
  if [ $(printf "Yes\nNo" | dmenu -i -p "${dev} detected. Mount?") = "Yes" ]; then
    # If there's no label, prompt for one
    if [ -z "$label" ]; then

      while true; do
        label=$(echo '' | dmenu -p "Enter a label for ${dev} (Alphanumeric, - and _)" | xargs)

        if echo "$label" | grep -q -E '^[a-zA-Z0-9\-_]+$'; then
          sudo e2label "$dev" "$label"
          break # Exit the look once a valid label is set
        else
          echo "Unvalid label, trying again"
        fi
      done
    fi

    # Mount the device
    home_dir="/home/$(logname)"
    mkdir -p "$home_dir/media/$label"
    sudo mount "$dev" "$home_dir/media/$label"
  else
    continue
  fi
done
