#!/bin/bash

while [[ -z "$(which zscroll)" ]]; do
    echo "you need to install zscroll"
    sleep 10
    echo idiot
    sleep 10
done

# see man zscroll for documentation of the following parameters
zscroll -l 20 \
    --delay 0.3 \
    --match-command "playerctl status spotify" \
    --match-text "Playing" "--scroll 1" \
    --match-text "Paused" "--scroll 0" \
    --update-check true "$HOME/.config/polybar/scripts/get_spotify_status.sh" &

wait

