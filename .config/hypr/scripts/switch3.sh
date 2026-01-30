#!/bin/bash

# Importing existing wallpaper script
SWWW_SCRIPT="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/scripts/swwwallpaper.sh"

# Define wallpaper directories for each theme
WALLPAPER_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/swww"
DEFAULT_DIR="$WALLPAPER_DIR/default"
DRACULA_DIR="$WALLPAPER_DIR/dracula"
GRUV_DIR="$WALLPAPER_DIR/gruv"
NORD_DIR="$WALLPAPER_DIR/nord"
EVERFOREST_DIR="$WALLPAPER_DIR/everforest"
EVERBLUSH_DIR="$WALLPAPER_DIR/everblush"
GRUVBOX_LIGHT_DIR="$WALLPAPER_DIR/gruvbox-light"
SOLARIZED_LIGHT_DIR="$WALLPAPER_DIR/solarized-light"
ZENBONES_DIR="$WALLPAPER_DIR/zenbones"
ALABASTER_DIR="$WALLPAPER_DIR/alabaster"
PAPERCOLOR_DIR="$WALLPAPER_DIR/papercolor"
MODUS_DIR="$WALLPAPER_DIR/modus"
TOKYONIGHT_DIR="$WALLPAPER_DIR/tokyonight"
ROSEPINE_DIR="$WALLPAPER_DIR/rosepine"
KANAGAWA_DIR="$WALLPAPER_DIR/kanagawa"

# Function to change wallpaper directory and set a wallpaper
change_wallpaper_theme() {
    local theme_dir="$1"

    if [ ! -d "$theme_dir" ]; then
        echo "Error: Wallpaper directory $theme_dir not found."
        exit 1
    fi

    # Get the first wallpaper in the directory
    local wallpaper=$(find "$theme_dir" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) | head -n 1)

    if [ -z "$wallpaper" ]; then
        echo "Error: No wallpapers found in $theme_dir"
        exit 1
    fi

    # Set the wallpaper using swwwallpaper script
    "$SWWW_SCRIPT" -s "$wallpaper"
}
 

case "$1" in
    -def|--default)
        change_wallpaper_theme "$DEFAULT_DIR"
        ;;
    -no|--nightowl)
        change_wallpaper_theme "$WALLPAPER_DIR/nightowl"
        ;;
    -d|--dracula)
        change_wallpaper_theme "$DRACULA_DIR"
        ;;
    -g|--gruv)
        change_wallpaper_theme "$GRUV_DIR"
        ;;
    -n|--nord)
        change_wallpaper_theme "$NORD_DIR"
        ;;
    -e|--everforest)
        change_wallpaper_theme "$EVERFOREST_DIR"
        ;;
    -b|--everblush)
        change_wallpaper_theme "$EVERBLUSH_DIR"
        ;;
    -gl|--gruvbox-light)
        change_wallpaper_theme "$GRUVBOX_LIGHT_DIR"
        ;;
    -sl|--solarized-light)
        change_wallpaper_theme "$SOLARIZED_LIGHT_DIR"
        ;;
    -z|--zenbones)
        change_wallpaper_theme "$ZENBONES_DIR"
        ;;
    -al|--alabaster)
        change_wallpaper_theme "$ALABASTER_DIR"
        ;;
    -p|--papercolor)
        change_wallpaper_theme "$PAPERCOLOR_DIR"
        ;;
    -m|--modus)
        change_wallpaper_theme "$MODUS_DIR"
        ;;
    -tn|--tokyonight)
        change_wallpaper_theme "$TOKYONIGHT_DIR"
        ;;
    -rp|--rosepine)
        change_wallpaper_theme "$ROSEPINE_DIR"
        ;;
    -rpd|--rosepine-dawn)
        change_wallpaper_theme "$WALLPAPER_DIR/rosepine-dawn"
        ;;
    -k|--kanagawa)
        change_wallpaper_theme "$KANAGAWA_DIR"
        ;;
    -bl|--blossom)
        change_wallpaper_theme "$WALLPAPER_DIR/blossom"
        ;;
    -bld|--blossom-dark)
        change_wallpaper_theme "$WALLPAPER_DIR/blossom-dark"
        ;;
    -cl|--catppuccin-latte)
        change_wallpaper_theme "$WALLPAPER_DIR/catppuccin-latte"
        ;;
    -sel|--selenized-light)
        change_wallpaper_theme "$WALLPAPER_DIR/selenized-light"
        ;;
    -hf|--huggingface)
        change_wallpaper_theme "$WALLPAPER_DIR/huggingface"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac
