#!/bin/bash

# Screenshot script - retakes all screenshots without Claude terminal
# Run this script and follow the prompts

SCREENSHOT_DIR="$HOME/dotfiles/screenshots"

echo "==========================================="
echo "Screenshot Retake Script"
echo "==========================================="
echo ""
echo "This script will help you take clean screenshots."
echo "Make sure to close or minimize the Claude terminal first!"
echo ""
echo "Press Enter when ready to start..."
read -r

# Switch to a clean workspace
echo "Switching to workspace 3 for clean screenshots..."
hyprctl dispatch workspace 3
sleep 2

# 1. Clean desktop
echo ""
echo "[1/8] Taking clean desktop screenshot..."
sleep 2
grim "$SCREENSHOT_DIR/01-desktop-clean.png"
echo "✓ Desktop captured"
sleep 1

# 2. btop
echo ""
echo "[2/8] Opening btop..."
foot btop &
BTOP_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/02-btop-system-monitor.png"
echo "✓ btop captured"
kill $BTOP_PID 2>/dev/null
sleep 1

# 3. fastfetch
echo ""
echo "[3/8] Opening fastfetch..."
foot sh -c "fastfetch && sleep 5" &
FETCH_PID=$!
sleep 2
grim "$SCREENSHOT_DIR/03-fastfetch-neofetch.png"
echo "✓ fastfetch captured"
wait $FETCH_PID 2>/dev/null
sleep 1

# 4. neovim
echo ""
echo "[4/8] Opening neovim..."
foot nvim ~/.config/hypr/hyprland.conf &
NVIM_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/04-neovim-editor.png"
echo "✓ neovim captured"
kill $NVIM_PID 2>/dev/null
sleep 1

# 5. yazi
echo ""
echo "[5/8] Opening yazi..."
foot yazi ~/.config/hypr &
YAZI_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/05-yazi-file-manager.png"
echo "✓ yazi captured"
kill $YAZI_PID 2>/dev/null
sleep 1

# 6. Firefox (if running)
echo ""
echo "[6/8] Attempting to capture Firefox..."
if hyprctl clients | grep -q "class: firefox"; then
    hyprctl dispatch focuswindow "class:firefox"
    sleep 2
    grim "$SCREENSHOT_DIR/06-firefox-browser.png"
    echo "✓ Firefox captured"
else
    echo "! Firefox not running, opening it..."
    firefox &
    sleep 5
    grim "$SCREENSHOT_DIR/06-firefox-browser.png"
    echo "✓ Firefox captured"
fi
sleep 1

# 7. Thunar
echo ""
echo "[7/8] Opening Thunar..."
thunar ~ &
THUNAR_PID=$!
sleep 3
grim "$SCREENSHOT_DIR/07-thunar-file-manager.png"
echo "✓ Thunar captured"
kill $THUNAR_PID 2>/dev/null
sleep 1

# 8. Waybar desktop
echo ""
echo "[8/8] Taking waybar desktop screenshot..."
hyprctl dispatch workspace 1
sleep 2
grim "$SCREENSHOT_DIR/08-waybar-desktop.png"
echo "✓ Waybar desktop captured"

echo ""
echo "==========================================="
echo "All screenshots captured successfully!"
echo "==========================================="
echo ""
echo "Screenshots saved to: $SCREENSHOT_DIR"
ls -lh "$SCREENSHOT_DIR"/*.png
echo ""
echo "You can now return to your work."
