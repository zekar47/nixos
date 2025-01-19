#!/bin/sh

# Show current date.
printf "%s  %s\n" "$(~/nixos/scripts/statusBar/getClock.sh)" "$(date +'%H:%M:%S%P')"
