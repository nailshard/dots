#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
FULLWIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 1)
BPC=".98"
export WIDTH=$(echo "($FULLWIDTH * $BPC)/1" | bc)
export XOFF=$(echo "($FULLWIDTH - $WIDTH)/2" | bc)
export YOFF=$(echo "$XOFF / 2" | bc)


WLAN_IFACE=""
ETH_IFACE=""
while read -r line ; do
    if [[ "$line" =~ ^[[:digit:]]:\ ([[:alnum:]]+): ]]; then
        iface="${BASH_REMATCH[1]}"
        [[ "$(ip link show "$iface")" =~ \<.+?,UP.+?\> ]] || continue
        iw dev $iface link | grep -q "Connected to" && WLAN_IFACE=$iface \
            || ETH_IFACE=$iface
        [[ -n $WLAN_IFACE ]] && [[ -n $ETH_IFACE ]] && break
    fi
done < <(ip -oneline link)
export WLAN_IFACE ETH_IFACE

MON=eDP1 polybar --reload bar >/tmp/pb.log 2>&1 & disown
