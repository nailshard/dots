#!/bin/bash

# Generate config on demand
[ ! -z "$1" ] && [ "$1" == "-r" ] && \
    $HOME/.local/bin/themer --template .config/polybar/config.template

# Hack for Polybar ARGB format
sed -i -E 's/([0-9a-fA-F]{2})#([0-9a-fA-F]{6})/#\1\2/g' $HOME/.config/polybar/config

# Load monitors info if not loaded already
[ -z "$PM_NAME" ] && . $HOME/.local/bin/moninfo

# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar --reload top &
polybar --reload bottom &
[ ! -z "$LM_NAME" ] && polybar --reload left &
[ ! -z "$RM_NAME" ] && polybar --reload right &
