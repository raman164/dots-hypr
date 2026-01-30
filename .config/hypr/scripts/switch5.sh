#!/bin/bash


# Rofi theme files
ROFI_THEME_DIR="$HOME/.config/rofi/themes"
ROFI_THEME_SYMLINK="$HOME/.config/rofi/themes/theme.rasi"

#Wlogout theme files
WLOGOUT_THEME_DIR="$HOME/.config/wlogout/colors"
WLOGOUT_THEME_SYMLINK="$HOME/.config/wlogout/colors/theme.css"

# Dunst config file
DUNST_CONFIG_FILE="$HOME/.config/dunst/dunstrc"
DUNST_THEME_DIR="$HOME/.config/dunst/themes"

# Wofi theme files
WOFI_THEME_DIR="$HOME/.config/wofi/colors"
WOFI_THEME_SYMLINK="$HOME/.config/wofi/colors/theme.css"



# Function to change the Rofi theme
change_rofi_theme() {
    local theme="$1"
    local theme_file="$ROFI_THEME_DIR/${theme}.rasi"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$ROFI_THEME_SYMLINK"
        echo "Changed Rofi theme to $theme"
        pkill -x rofi
    else
        echo "Error: Rofi theme file $theme_file not found"
    fi
}


# Function to change the wlogout theme
change_wlogout_theme() {
    local theme="$1"
    local theme_file="$WLOGOUT_THEME_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$WLOGOUT_THEME_SYMLINK"
        echo "Changed wlogout theme to $theme"
    else
        echo "Error: wlogout theme file $theme_file not found"
    fi
}


# Function to change the Dunst theme
change_dunst_theme() {
    local theme="$1"
    local theme_file="$DUNST_THEME_DIR/$theme"
    if [ -f "$DUNST_CONFIG_FILE" ] && [ -f "$theme_file" ]; then
        # Truncate after line 57 (after [experimental] section)
        sed -i '57,$d' "$DUNST_CONFIG_FILE"
        echo "" >> "$DUNST_CONFIG_FILE"
        cat "$theme_file" >> "$DUNST_CONFIG_FILE"
        echo "Changed Dunst theme to $theme"
        killall dunst 2>/dev/null
        sleep 0.3
        dunst &
        disown
    else
        echo "Error: Dunst config file or theme file not found"
    fi
}


# Function to change the Wofi theme
change_wofi_theme() {
    local theme="$1"
    local theme_file="$WOFI_THEME_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$WOFI_THEME_SYMLINK"
        echo "Changed Wofi theme to $theme"
    else
        echo "Error: Wofi theme file $theme_file not found"
    fi
}

# Function to change all themes
change_all_themes() {
    local rofi_theme="$1"
    local wlogout_theme="$2"
    local dunst_theme="$3"
    local wofi_theme="$4"

    change_rofi_theme "$rofi_theme"
    change_wlogout_theme "$wlogout_theme"
    change_dunst_theme "$dunst_theme"
    change_wofi_theme "$wofi_theme"

    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -def|--default)
        change_all_themes "default" "default" "default" "default"
        ;;
    -no|--nightowl)
        change_all_themes "nightowl" "nightowl" "nightowl" "nightowl"
        ;;
    -d|--dracula)
        change_all_themes "dracula" "dracula" "dracula" "dracula"
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruv" "gruv" "gruv"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord" "nord" "nord"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest" "everforest" "everforest"
        ;;
    -b|--everblush)
        change_all_themes "everblush" "everblush" "everblush" "everblush"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "gruvbox-light" "gruvbox-light" "gruvbox-light" "gruvbox-light"
        ;;
    -sl|--solarized-light)
        change_all_themes "solarized-light" "solarized-light" "solarized-light" "solarized-light"
        ;;
    -z|--zenbones)
        change_all_themes "zenbones" "zenbones" "zenbones" "zenbones"
        ;;
    -al|--alabaster)
        change_all_themes "alabaster" "alabaster" "alabaster" "alabaster"
        ;;
    -p|--papercolor)
        change_all_themes "papercolor" "papercolor" "papercolor" "papercolor"
        ;;
    -m|--modus)
        change_all_themes "modus" "modus" "modus" "modus"
        ;;
    -tn|--tokyonight)
        change_all_themes "tokyonight" "tokyonight" "tokyonight" "tokyonight"
        ;;
    -rp|--rosepine)
        change_all_themes "rosepine" "rosepine" "rosepine" "rosepine"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "rosepine-dawn" "rosepine-dawn" "rosepine-dawn" "rosepine-dawn"
        ;;
    -k|--kanagawa)
        change_all_themes "kanagawa" "kanagawa" "kanagawa" "kanagawa"
        ;;
    -bl|--blossom)
        change_all_themes "blossom" "blossom" "blossom" "blossom"
        ;;
    -bld|--blossom-dark)
        change_all_themes "blossom-dark" "blossom-dark" "blossom-dark" "blossom-dark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "catppuccin-latte" "catppuccin-latte" "catppuccin-latte" "catppuccin-latte"
        ;;
    -sel|--selenized-light)
        change_all_themes "selenized-light" "selenized-light" "selenized-light" "selenized-light"
        ;;
    -hf|--huggingface)
        change_all_themes "huggingface" "huggingface" "huggingface" "huggingface"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac
