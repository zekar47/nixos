#!/bin/sh

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [ "$MUTED" = "[MUTED]" ]; then
  ICON=""
else
  if [ "$VOL" -ge 66 ]; then
    ICON=""
  elif [ "$VOL" -ge 33 ]; then
    ICON=""
  else
    ICON=""
  fi
fi

printf "%s  %s%%" "$ICON" "$VOL"
