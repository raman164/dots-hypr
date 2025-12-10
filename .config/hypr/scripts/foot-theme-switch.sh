#!/bin/bash

THEMES_DIR="/usr/share/foot/themes"
FOOT_CONFIG="$HOME/.config/foot/foot.ini"

# List available themes
THEMES=($(ls "$THEMES_DIR" 2>/dev/null))

# Show selection menu (Wofi)
SELECTED_THEME=$(printf '%s\n' "${THEMES[@]}" | wofi --dmenu --prompt "Select Foot Theme")

if [ -n "$SELECTED_THEME" ]; then
    # Backup current config (optional)
    cp "$FOOT_CONFIG" "$FOOT_CONFIG.bak" 2>/dev/null

    # Update or add the 'include' line in foot.ini
    if grep -q "^include" "$FOOT_CONFIG"; then
        # Replace existing include line
        sed -i "s|^include.*|include = $THEMES_DIR/$SELECTED_THEME|" "$FOOT_CONFIG"
    else
        # Add include line if missing (e.g., at the end of the file)
        echo -e "\n[main]\ninclude = $THEMES_DIR/$SELECTED_THEME" >> "$FOOT_CONFIG"
    fi

    # Restart Foot server to apply changes
    pkill -x foot
    foot --server &
    notify-send "Foot Theme" "Theme set to: $SELECTED_THEME"
fi