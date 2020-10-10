#!/bin/bash

# # Generate config on demand
# [ ! -z "$1" ] && [ "$1" == "-r" ] && \
#     $HOME/.local/bin/themer --template .config/polybar/config.template

# # Hack for Polybar ARGB format
# sed -i -E 's/([0-9a-fA-F]{2})#([0-9a-fA-F]{6})/#\1\2/g' $HOME/.config/polybar/config


# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
export LM_NAME=DP-1-1.1
export RM_NAME=DP-1-1.3
export PM_NAME=DP-1-1.2
export WLAN=wlp0s20f3
export BAT=$(find /sys/class/power_supply/  | grep -oE 'BAT.*$')
export ACAD=$(find /sys/class/power_supply/  | grep -oE 'AC.*$')
for i in $(seq 1 3); do
    echo $WLAN
    MON=DP-1-1.$i WLAN=$WLAN BAT=$BAT ACAD=$ACAD polybar --reload top &
    MON=DP-1-1.$i WLAN=$WLAN BAT=$BAT ACAD=$ACAD polybar --reload bottom &
done
# [ ! -z "$LM_NAME" ] && polybar --reload left &
# [ ! -z "$RM_NAME" ] && polybar --reload right &
