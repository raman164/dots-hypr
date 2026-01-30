#!/bin/bash

# Discord theme file location
DISCORD_THEME_FILE="$HOME/.config/BetterDiscord/data/stable/themes.json"

# btop configuration file location
BTOP_CONFIG_FILE="$HOME/.config/btop/btop.conf"

# Kitty theme files
KITTY_THEME_DIR="$HOME/.config/kitty/themes"
KITTY_THEME_SYMLINK="$HOME/.config/kitty/themes/theme.conf"

# Foot theme files
FOOT_THEME_DIR="$HOME/.config/foot/themes"
FOOT_THEME_SYMLINK="$HOME/.config/foot/themes/theme"

# Hyprlock config file
HYPRLOCK_THEME_DIR="$HOME/.config/hypr/hyprlock-themes"
HYPRLOCK_THEME_SYMLINK="$HOME/.config/hypr/hyprlock.conf"

# Tmux theme files
TMUX_THEME_DIR="$HOME/.config/tmux/themes"
TMUX_THEME_SYMLINK="$HOME/.config/tmux/themes/theme.conf"

# Function to change the Discord theme
change_discord_theme() {
    local theme_name="$1"

    if [ -f "$DISCORD_THEME_FILE" ]; then
        cp "$DISCORD_THEME_FILE" "${DISCORD_THEME_FILE}.bak"
        jq --arg theme "$theme_name" '. |= with_entries(.value = false) | .[$theme] = true' "$DISCORD_THEME_FILE" > "${DISCORD_THEME_FILE}.tmp" && mv "${DISCORD_THEME_FILE}.tmp" "$DISCORD_THEME_FILE"
        echo "Changed Discord theme to $theme_name"

        if pgrep -x "Discord" > /dev/null; then
            xdotool search --onlyvisible --class "discord" windowactivate --sync key ctrl+r
            echo "Discord has been reloaded."
        else
            echo "Discord is not running."
        fi
    fi
}

# Function to change the btop theme
change_btop_theme() {
    local theme_name="$1"

    if [ -f "$BTOP_CONFIG_FILE" ]; then
        sed -i "s|^color_theme=.*|color_theme=\"/usr/share/btop/themes/${theme_name}.theme\"|" "$BTOP_CONFIG_FILE"
        echo "Changed btop theme to $theme_name"
    fi
}

# Function to change the Kitty theme
change_kitty_theme() {
    local theme="$1"
    local theme_file="$KITTY_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$KITTY_THEME_SYMLINK"
        echo "Changed Kitty theme to $theme"
        killall -SIGUSR1 kitty 2>/dev/null
    fi
}

# Function to change the Foot theme
change_foot_theme() {
    local theme="$1"
    local theme_file="$FOOT_THEME_DIR/${theme}"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$FOOT_THEME_SYMLINK"
        echo "Changed Foot theme to $theme"
        # Live reload colors in all running terminals
        ~/.config/hypr/scripts/foot-colors.sh 2>/dev/null &
    else
        echo "Error: Foot theme file $theme_file not found"
    fi
}

# Function to change the Hyprlock theme
change_hyprlock_theme() {
    local theme="$1"
    local theme_file="$HYPRLOCK_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$HYPRLOCK_THEME_SYMLINK"
        echo "Changed Hyprlock theme to $theme"
    fi
}

# Function to change the Tmux theme
change_tmux_theme() {
    local theme="$1"
    local theme_file="$TMUX_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$TMUX_THEME_SYMLINK"
        echo "Changed Tmux theme to $theme"
        # Reload tmux config if tmux is running
        tmux source-file ~/.config/tmux/tmux.conf 2>/dev/null && echo "Tmux config reloaded"
    fi
}

# Function to change all themes
change_all_themes() {
    local discord_theme="$1"
    local btop_theme="$2"
    local kitty_theme="$3"
    local hyprlock_theme="$4"
    local foot_theme="$5"
    local tmux_theme="$6"

    change_discord_theme "$discord_theme"
    change_btop_theme "$btop_theme"
    change_kitty_theme "$kitty_theme"
    change_hyprlock_theme "$hyprlock_theme"
    change_foot_theme "$foot_theme"
    change_tmux_theme "$tmux_theme"

    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -def|--default)
        change_all_themes "default" "catppuccin_mocha" "Default" "default" "default" "dark"
        ;;
    -no|--nightowl)
        change_all_themes "nightowl" "dracula" "NightOwl" "nightowl" "nightowl" "dark"
        ;;
    -d|--dracula)
        change_all_themes "dracula" "dracula" "Dracula" "dracula" "dracula" "dark"
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruvbox_dark_v2" "Gruv" "gruv" "gruv" "dark"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord" "Nord" "nord" "nord" "dark"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest-dark-medium" "Everforest" "everforest" "everforest" "dark"
        ;;
    -b|--everblush)
        change_all_themes "everblush" "adapta" "Everblush" "everblush" "everblush" "dark"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "gruvbox-light" "gruvbox_light" "GruvboxLight" "gruvbox-light" "gruvbox-light" "light"
        ;;
    -sl|--solarized-light)
        change_all_themes "solarized-light" "solarized_light" "SolarizedLight" "solarized-light" "solarized-light" "light"
        ;;
    -z|--zenbones)
        change_all_themes "zenbones" "flat-remix-light" "Zenbones" "zenbones" "zenbones" "light"
        ;;
    -al|--alabaster)
        change_all_themes "alabaster" "flat-remix-light" "Alabaster" "alabaster" "alabaster" "light"
        ;;
    -p|--papercolor)
        change_all_themes "papercolor" "flat-remix-light" "PaperColor" "papercolor" "papercolor" "light"
        ;;
    -m|--modus)
        change_all_themes "modus" "flat-remix-light" "Modus" "modus" "modus" "light"
        ;;
    -tn|--tokyonight)
        change_all_themes "tokyonight" "tokyo-night" "TokyoNight" "tokyonight" "tokyonight" "dark"
        ;;
    -rp|--rosepine)
        change_all_themes "rosepine" "rose-pine" "RosePine" "rosepine" "rosepine" "dark"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "rosepine-dawn" "rose-pine" "RosePineDawn" "rosepine-dawn" "rosepine-dawn" "light"
        ;;
    -k|--kanagawa)
        change_all_themes "kanagawa" "dracula" "Kanagawa" "kanagawa" "kanagawa" "dark"
        ;;
    -bl|--blossom)
        change_all_themes "blossom" "flat-remix-light" "Blossom" "blossom" "blossom" "light"
        ;;
    -bld|--blossom-dark)
        change_all_themes "blossom-dark" "dracula" "BlossomDark" "blossom-dark" "blossom-dark" "dark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "catppuccin-latte" "catppuccin-latte" "CatppuccinLatte" "catppuccin-latte" "catppuccin-latte" "light"
        ;;
    -sel|--selenized-light)
        change_all_themes "selenized-light" "selenized-light" "SelenizedLight" "selenized-light" "selenized-light" "light"
        ;;
    -hf|--huggingface)
        change_all_themes "huggingface" "dracula" "HuggingFace" "huggingface" "huggingface" "dark"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac
