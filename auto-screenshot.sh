#!/bin/bash

# Automated screenshot script for workspace 4
# No interaction required

SCREENSHOT_DIR="$HOME/dotfiles/screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Switch to workspace 4
hyprctl dispatch workspace 4
sleep 2

# 1. Clean desktop
grim "$SCREENSHOT_DIR/01-desktop-clean.png"
sleep 1

# 2. btop
foot btop &
BTOP_PID=$!
sleep 4
grim "$SCREENSHOT_DIR/02-btop-system-monitor.png"
kill $BTOP_PID 2>/dev/null
sleep 1

# 3. fastfetch
foot sh -c "fastfetch && sleep 4" &
sleep 2
grim "$SCREENSHOT_DIR/03-fastfetch-neofetch.png"
sleep 3

# 4. neovim
foot nvim ~/.config/hypr/hyprland.conf &
NVIM_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/04-neovim-editor.png"
kill $NVIM_PID 2>/dev/null
sleep 1

# 5. yazi
foot yazi ~/.config/hypr &
YAZI_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/05-yazi-file-manager.png"
kill $YAZI_PID 2>/dev/null
sleep 1

# 6. Firefox
firefox --new-window about:blank &
sleep 5
grim "$SCREENSHOT_DIR/06-firefox-browser.png"
sleep 1

# 7. Thunar
thunar ~ &
THUNAR_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/07-thunar-file-manager.png"
kill $THUNAR_PID 2>/dev/null
sleep 1

# 8. Waybar desktop view
grim "$SCREENSHOT_DIR/08-waybar-desktop.png"

echo "Screenshots completed in workspace 4"
