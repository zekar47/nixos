#!/bin/sh

NO_INTERNET_ICON="󰤮"
ETHERNET_ICON=""
VPN_ICON="󰌾"

VPN_STATUS=""
[ -n "$(cat /sys/class/net/tun*/operstate 2>/dev/null)" ] && VPN_STATUS="$VPN_ICON"

# Detect Ethernet connection
if [ "$(cat /sys/class/net/e*/operstate 2>/dev/null)" = "up" ]; then
    printf "%s %s\n" "$ETHERNET_ICON" "$VPN_STATUS"
    exit 0
fi

# Detect WiFi connection
if [ "$(cat /sys/class/net/w*/operstate 2>/dev/null)" = "up" ]; then
    # Get WiFi signal strength
    SIGNAL=$(awk '/^\s*w/ { print int($3 * 100 / 70) }' /proc/net/wireless)
    SSID=$(iwgetid -r)

    # Check for internet connectivity
    if ping -q -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; then
        if [ "$SIGNAL" -ge 75 ]; then
            WIFI_ICON="󰤨"
        elif [ "$SIGNAL" -ge 50 ]; then
            WIFI_ICON="󰤥"
        elif [ "$SIGNAL" -ge 25 ]; then
            WIFI_ICON="󰤢"
        elif [ "$SIGNAL" -ge 5 ]; then
            WIFI_ICON="󰤟"
        else
            WIFI_ICON="󰤯"
        fi
    else
        if [ "$SIGNAL" -ge 75 ]; then
            WIFI_ICON="󰤩"
        elif [ "$SIGNAL" -ge 50 ]; then
            WIFI_ICON="󰤦"
        elif [ "$SIGNAL" -ge 25 ]; then
            WIFI_ICON="󰤣"
        elif [ "$SIGNAL" -ge 5 ]; then
            WIFI_ICON="󰤠"
        else
            WIFI_ICON="󰤫"
        fi
    fi

    printf "%s  %s%% %s %s" "$WIFI_ICON" "$SIGNAL" "$SSID" "$VPN_STATUS"
else
    # No network connection
    printf "%s" "$NO_INTERNET_ICON"
fi
