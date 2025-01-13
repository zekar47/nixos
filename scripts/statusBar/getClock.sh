#!/bin/sh

hour=$(date +%I | sed 's/^0//')
minute=$(date +%M | sed 's/^0//')

if [ "$minute" -lt 15 ] || [ "$minute" -ge 45 ]; then
  half=0
  # Adjust hour if the time is in the last 15 minutes of the current hour
  if [ "$minute" -ge 45 ]; then
    hour=$((hour % 12 + 1))
  fi
else
  half=30
fi

case "$hour" in
  1)  [ "$half" -eq 0 ] && echo "🕐" || echo "🕜" ;;
  2)  [ "$half" -eq 0 ] && echo "🕑" || echo "🕝" ;;
  3)  [ "$half" -eq 0 ] && echo "🕒" || echo "🕞" ;;
  4)  [ "$half" -eq 0 ] && echo "🕓" || echo "🕟" ;;
  5)  [ "$half" -eq 0 ] && echo "🕔" || echo "🕠" ;;
  6)  [ "$half" -eq 0 ] && echo "🕕" || echo "🕡" ;;
  7)  [ "$half" -eq 0 ] && echo "🕖" || echo "🕢" ;;
  8)  [ "$half" -eq 0 ] && echo "🕗" || echo "🕣" ;;
  9)  [ "$half" -eq 0 ] && echo "🕘" || echo "🕤" ;;
  10) [ "$half" -eq 0 ] && echo "🕙" || echo "🕥" ;;
  11) [ "$half" -eq 0 ] && echo "🕚" || echo "🕦" ;;
  12) [ "$half" -eq 0 ] && echo "🕛" || echo "🕧" ;;
esac
