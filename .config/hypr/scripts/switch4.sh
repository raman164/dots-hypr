#!/bin/bash

# Function to change VS Code theme
change_vscode_theme() {
    local theme="$1"
    local settings_file="$HOME/.config/Code/User/settings.json"
    local new_theme=""

    case "$theme" in
        "dracula")
            new_theme="Dracula Clean"
            ;;
        "gruv")
            new_theme="Gruvbox Dark Medium"
            ;;
        "nord")
            new_theme="Nord"
            ;;
        "everforest")
            new_theme="Everforest Dark"
            ;;
        "everblush")
            new_theme="Everblush"
            ;;
        "gruvbox-light")
            new_theme="Gruvbox Light Medium"
            ;;
        "solarized-light")
            new_theme="Solarized Light"
            ;;
        "zenbones")
            new_theme="Zenbones"
            ;;
        "alabaster")
            new_theme="Alabaster"
            ;;
        "papercolor")
            new_theme="PaperColor Light"
            ;;
        "modus")
            new_theme="Modus Operandi"
            ;;
        "tokyonight")
            new_theme="Tokyo Night"
            ;;
        "rosepine")
            new_theme="Rosé Pine"
            ;;
        "kanagawa")
            new_theme="Kanagawa"
            ;;
        "blossom")
            new_theme="Quiet Light"
            ;;
        "blossom-dark")
            new_theme="Quiet Light"
            ;;
        "catppuccin-latte")
            new_theme="Catppuccin Latte"
            ;;
        "selenized-light")
            new_theme="Solarized Light"
            ;;
        "huggingface")
            new_theme="One Dark Pro"
            ;;
        "zelda")
            new_theme="One Light"
            ;;
    esac

    if [ -f "$settings_file" ]; then
        sed -i "s/\"workbench.colorTheme\": \"[^\"]*\"/\"workbench.colorTheme\": \"$new_theme\"/" "$settings_file"
        echo "Changed VS Code theme to $new_theme"
    else
        echo "Error: VS Code settings file not found"
    fi
}

# Function to change the Waybar theme for all waybar theme directories
change_waybar_theme() {
    local theme="$1"

    # List of waybar theme directories that have colors subdirectory
    local waybar_themes=(
        "$HOME/.config/waybar/themes/style1"
        "$HOME/.config/waybar/themes/unique"
        "$HOME/.config/waybar/themes/bizare-top"
        "$HOME/.config/waybar/themes/bizare-left"
    )

    for theme_dir in "${waybar_themes[@]}"; do
        local theme_file="$theme_dir/colors/${theme}.css"
        local symlink="$theme_dir/colors/theme.css"

        if [ -f "$theme_file" ]; then
            ln -sf "$theme_file" "$symlink"
            echo "Changed Waybar theme in $(basename $theme_dir) to $theme"
        fi
    done

    # Restart waybar to apply new colors
    killall waybar 2>/dev/null
    sleep 0.5
    waybar &
    disown
}

# Function to change all themes
change_all_themes() {
    local vscode_theme="$1"
    local waybar_theme="$2"

    change_vscode_theme "$vscode_theme"
    change_waybar_theme "$waybar_theme"

    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -def|--default)
        change_all_themes "default" "default"
        ;;
    -no|--nightowl)
        change_all_themes "nightowl" "nightowl"
        ;;
    -d|--dracula)
        change_all_themes "dracula" "dracula"
        ;;
    -g|--gruv)
        change_all_themes "gruv" "gruv"
        ;;
    -n|--nord)
        change_all_themes "nord" "nord"
        ;;
    -e|--everforest)
        change_all_themes "everforest" "everforest"
        ;;
    -b|--everblush)
        change_all_themes "everblush" "everblush"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "gruvbox-light" "gruvbox-light"
        ;;
    -sl|--solarized-light)
        change_all_themes "solarized-light" "solarized-light"
        ;;
    -z|--zenbones)
        change_all_themes "zenbones" "zenbones"
        ;;
    -al|--alabaster)
        change_all_themes "alabaster" "alabaster"
        ;;
    -p|--papercolor)
        change_all_themes "papercolor" "papercolor"
        ;;
    -m|--modus)
        change_all_themes "modus" "modus"
        ;;
    -tn|--tokyonight)
        change_all_themes "tokyonight" "tokyonight"
        ;;
    -rp|--rosepine)
        change_all_themes "rosepine" "rosepine"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "rosepine-dawn" "rosepine-dawn"
        ;;
    -k|--kanagawa)
        change_all_themes "kanagawa" "kanagawa"
        ;;
    -bl|--blossom)
        change_all_themes "blossom" "blossom"
        ;;
    -bld|--blossom-dark)
        change_all_themes "blossom-dark" "blossom-dark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "catppuccin-latte" "catppuccin-latte"
        ;;
    -sel|--selenized-light)
        change_all_themes "selenized-light" "selenized-light"
        ;;
    -hf|--huggingface)
        change_all_themes "huggingface" "huggingface"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac
