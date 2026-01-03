#!/bin/bash

# Path to your wallpaper directory
DIR=$HOME/Pictures/Wallpapers

# Time between changes (in seconds)
INTERVAL=120

# List of available swww transitions
TRANSITIONS=("outer" "random" "wipe" "wave" "grow" "center" "any" "step")

while true; do
    # Find a random image
    WALLPAPER=$(find "$DIR" -type f | shuf -n 1)
    
    # Pick a random transition from the list above
    RANDOM_TRANSITION=${TRANSITIONS[$RANDOM % ${#TRANSITIONS[@]}]}
    
    # Change the wallpaper with the random transition
    swww img "$WALLPAPER" \
        --transition-type "$RANDOM_TRANSITION" \
        --transition-fps 60 \
        --transition-step 10 \
        --transition-duration 2
    
    sleep $INTERVAL
done
