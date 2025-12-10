#!/bin/bash

# Screenshot automation script for dotfiles showcase
# This script will take screenshots of various applications

SCREENSHOT_DIR="$HOME/dotfiles/screenshots"
mkdir -p "$SCREENSHOT_DIR"

echo "Starting screenshot capture in 3 seconds..."
echo "Please minimize or close the terminal running this script!"
sleep 3

# Function to take screenshot with delay
take_screenshot() {
    local name=$1
    local delay=${2:-2}
    echo "Taking screenshot: $name (in ${delay}s)..."
    sleep "$delay"
    grim "$SCREENSHOT_DIR/$name.png"
    echo "✓ Captured: $name.png"
}

# 1. Clean desktop / Hyprland setup
echo "Switch to a clean workspace or desktop setup..."
sleep 2
take_screenshot "01-desktop-clean" 3

# 2. Launch and screenshot btop
echo "Opening btop..."
alacritty -e btop &
BTOP_PID=$!
take_screenshot "02-btop-system-monitor" 4
kill $BTOP_PID 2>/dev/null

# 3. Launch and screenshot fastfetch
echo "Opening fastfetch..."
alacritty -e sh -c "fastfetch; sleep 5" &
FETCH_PID=$!
take_screenshot "03-fastfetch-info" 3
wait $FETCH_PID

# 4. Launch neovim
echo "Opening neovim..."
alacritty -e nvim ~/.config/hypr/hyprland.conf &
NVIM_PID=$!
take_screenshot "04-neovim-editor" 4
kill $NVIM_PID 2>/dev/null

# 5. Launch yazi file manager
echo "Opening yazi..."
alacritty -e yazi ~/.config &
YAZI_PID=$!
take_screenshot "05-yazi-file-manager" 4
kill $YAZI_PID 2>/dev/null

# 6. Multiple windows / workflow
echo "Please arrange some windows to show your workflow..."
echo "Press Enter when ready..."
read -r
take_screenshot "06-workflow-multi-windows" 2

# 7. Fuzzel launcher (if you can trigger it)
echo "Open fuzzel launcher (Super+D) if you want to capture it..."
sleep 3
take_screenshot "07-launcher" 2

echo ""
echo "Screenshot capture complete!"
echo "Screenshots saved to: $SCREENSHOT_DIR"
echo ""
ls -lh "$SCREENSHOT_DIR"
