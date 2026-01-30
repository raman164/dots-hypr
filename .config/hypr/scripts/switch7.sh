#!/bin/bash

# Obsidian config file location
OBSIDIAN_CONFIG="$HOME/Documents/Obsidian Vault/.obsidian/appearance.json"

# Okular themes file location
OKULAR_THEME_DIR="$HOME/.config/okular-theme"
OKULAR_SYMLINK_FILE="$HOME/.config/okularpartrc"

# Logseq theme file location
LOGSEQ_THEME_DIR="$HOME/.config/logseq-themes"
LOGSEQ_SYMLINK_FILE="$HOME/.logseq/plugins/logseq-flow-nord-theme/nord.css"

# NvChad config file location
NVIM_CONFIG="$HOME/.config/nvim/lua/chadrc.lua"

# Cava themes file location
CAVA_THEME_DIR="$HOME/.config/cava/themes"
CAVA_SYMLINK_FILE="$HOME/.config/cava/config"

# Firefox themes file location
FIREFOX_THEME_DIR="$HOME/.config/Firefox-Theme"
FIREFOX_SYMLINK_FILE="$HOME/.mozilla/firefox/b2tf0ph7.default-release/chrome/theme/colors/dark.css"


# Function to change the Obsidian theme
change_obsidian_theme() {
    local theme="$1"
    if [ -f "$OBSIDIAN_CONFIG" ]; then
        sed -i 's/"cssTheme": "[^"]*",/"cssTheme": "'"$theme"'",/' "$OBSIDIAN_CONFIG"
        echo "Changed Obsidian theme to $theme"
    else
        echo "Error: Obsidian config file $OBSIDIAN_CONFIG not found"
    fi
}

# Function to change the Okular theme
change_okular_theme() {
    local theme="$1"
    local theme_file="$OKULAR_THEME_DIR/${theme}"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$OKULAR_SYMLINK_FILE"
        echo "change okular theme to $theme"
    else
        echo "Error: Okular theme file $theme_file not found"
    fi
}

# Function to change the Logseq theme
change_logseq_theme() {
    local theme="$1"
    local theme_file="$LOGSEQ_THEME_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$LOGSEQ_SYMLINK_FILE"
        echo "change logseq theme to $theme"
    else
        echo "Error: Logseq theme file $theme_file not found"
        fi
}

# Function to change the Neovim theme
change_neovim_theme() {
    local theme="$1"
    local theme_file="$HOME/.config/nvim/current_theme"

    # Write the theme name to the current_theme file
    echo "$theme" > "$theme_file"
    echo "Changed Neovim theme to $theme"

    # Note: Neovim will pick up the new theme on next restart
    # or you can manually run :lua vim.cmd("colorscheme <name>")
}

# Function to change the Cava theme
change_cava_theme() {
    local theme="$1"
    local theme_file="$CAVA_THEME_DIR/${theme}"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$CAVA_SYMLINK_FILE"
        echo "change cava theme to $theme"
    else
        echo "Error: Cava theme file $theme_file not found"
    fi
}

# Function to change the Firefox theme
change_firefox_theme() {
    local theme="$1"
    local theme_file="$FIREFOX_THEME_DIR/${theme}.css"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$FIREFOX_SYMLINK_FILE"
        echo "Changed firefox theme to $theme"
    
    else
        echo "Error: firefox theme file $theme_file not found"
    fi
}


# Function to change all themes
change_all_themes() {
    local obsidian_theme="$1"
    local okular_theme="$2"
    local logseq_theme="$3"
    local neovim_theme="$4"
    local cava_theme="$5"
    local firefox_theme="$6"

    change_obsidian_theme "$obsidian_theme"
    change_okular_theme "$okular_theme"
    change_logseq_theme "$logseq_theme"
    change_neovim_theme "$neovim_theme"
    change_cava_theme "$cava_theme"
    change_firefox_theme "$firefox_theme"


    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -def|--default)
        change_all_themes "Catppuccin" "default" "default" "default" "default" "Default"
        ;;
    -no|--nightowl)
        change_all_themes "Dracula Gemini" "nightowl" "nightowl" "nightowl" "nightowl" "NightOwl"
        ;;
    -d|--dracula)
        change_all_themes "Dracula Gemini" "dracula" "dracula" "dracula" "dracula" "Dracula"
        ;;
    -g|--gruv)
        change_all_themes "Obsidian gruvbox" "gruv" "gruv" "gruvbox" "gruv" "Gruv"
        ;;
    -n|--nord)
        change_all_themes "Nordic" "nord" "nord" "nord" "nord" "Nord"
        ;;
    -e|--everforest)
        change_all_themes "Everforest" "everforest" "everforest" "everforest" "everforest" "Everforest"
        ;;
    -b|--everblush)
        change_all_themes "Everblush" "everblush" "everblush" "everblush" "everblush" "Everblush"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "Gruvbox Light" "gruvbox-light" "gruvbox-light" "gruvbox-light" "gruvbox-light" "GruvboxLight"
        ;;
    -sl|--solarized-light)
        change_all_themes "Solarized" "solarized-light" "solarized-light" "solarized-light" "solarized-light" "SolarizedLight"
        ;;
    -z|--zenbones)
        change_all_themes "Minimal" "zenbones" "zenbones" "zenbones" "zenbones" "Zenbones"
        ;;
    -al|--alabaster)
        change_all_themes "Minimal" "alabaster" "alabaster" "alabaster" "alabaster" "Alabaster"
        ;;
    -p|--papercolor)
        change_all_themes "Minimal" "papercolor" "papercolor" "papercolor" "papercolor" "PaperColor"
        ;;
    -m|--modus)
        change_all_themes "Minimal" "modus" "modus" "modus" "modus" "Modus"
        ;;
    -tn|--tokyonight)
        change_all_themes "Tokyo Night" "tokyonight" "tokyonight" "tokyonight" "tokyonight" "TokyoNight"
        ;;
    -rp|--rosepine)
        change_all_themes "Rose Pine" "rosepine" "rosepine" "rosepine" "rosepine" "RosePine"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "Rose Pine Dawn" "rosepine-dawn" "rosepine-dawn" "rosepine-dawn" "rosepine-dawn" "RosePineDawn"
        ;;
    -k|--kanagawa)
        change_all_themes "Minimal" "kanagawa" "kanagawa" "kanagawa" "kanagawa" "Kanagawa"
        ;;
    -bl|--blossom)
        change_all_themes "Minimal" "blossom" "blossom" "blossom" "blossom" "Blossom"
        ;;
    -bld|--blossom-dark)
        change_all_themes "Minimal" "blossom-dark" "blossom-dark" "blossom-dark" "blossom-dark" "BlossomDark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "Catppuccin" "catppuccin-latte" "catppuccin-latte" "catppuccin-latte" "catppuccin-latte" "CatppuccinLatte"
        ;;
    -sel|--selenized-light)
        change_all_themes "Solarized" "selenized-light" "selenized-light" "selenized-light" "selenized-light" "SelenizedLight"
        ;;
    -hf|--huggingface)
        change_all_themes "Minimal" "huggingface" "huggingface" "huggingface" "huggingface" "HuggingFace"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac

