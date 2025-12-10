#!/bin/bash

# Directory containing Foot themes\
THEMES_DIR="/usr/share/foot/themes"

# Get list of themes\
THEMES=($(ls $THEMES_DIR))

# Show theme selection in Wofi\
SELECTED_THEME=$(printf '%s\n' "${THEMES[@]}" | wofi --dmenu --prompt "Select Foot Theme")

# Check if a theme was selected\
if [ -n "$SELECTED_THEME" ]; then
    # Create a temporary config file with the new theme\
    TEMP_CONFIG=$(mktemp)
    echo "[main]" > "$TEMP_CONFIG"
    echo "include = $THEMES_DIR/$SELECTED_THEME" >> "$TEMP_CONFIG"

    # Replace Foot's config (if running as server)\
    if pgrep -x "foot" > /dev/null; then
        # Kill existing Foot server\
        pkill -x foot
    fi

    # Start Foot with the new theme\
    foot --config="$TEMP_CONFIG" --server &
    notify-send "Foot Theme Changed" "Applied: $SELECTED_THEME"
fi
