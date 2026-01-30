#!/bin/bash

# Set a known working directory
cd "$HOME" || exit 1

# QT Configuration files
QT5CT_CONFIG="$HOME/.config/qt5ct/qt5ct.conf"
QT6CT_CONFIG="$HOME/.config/qt6ct/qt6ct.conf"

# Kvantum config file
KVANTUM_THEME_DIR="$HOME/.config/Kvantum/themes"
KVANTUM_THEME_SYMLINK="$HOME/.config/Kvantum/kvantum.kvconfig"

# Function to change Qt5 Icons
change_qt5_icon() {
    local icon_theme="$1"
    sed -i "/^icon_theme=/c\icon_theme=${icon_theme}" "$QT5CT_CONFIG"
    echo "Changed icon theme to $icon_theme"
}

# Function to change Qt5 theme 
change_qt5_theme() {
    local theme="$1"
    sed -i "/^color_scheme_path=/c\color_scheme_path=$HOME/.config/qt5ct/colors/${theme}.conf" "$QT5CT_CONFIG"
    echo "Changed Qt5 theme to $theme"
}

# Function to change Qt6 Icons
change_qt6_icon() {
    local icon_theme="$1"
    sed -i "/^icon_theme=/c\icon_theme=${icon_theme}" "$QT6CT_CONFIG"
    echo "Changed Qt6 icon theme to $icon_theme"
}

#Function to change Qt6 theme
change_qt6_theme() {
    local theme="$1"
    sed -i "/^color_scheme_path=/c\color_scheme_path=$HOME/.config/qt6ct/colors/${theme}.conf" "$QT6CT_CONFIG"
    echo "Changed Qt6 theme to $theme"
}

# Function to change the Kvantum theme
change_kvantum_theme() {
    local theme="$1"
    local theme_file="$KVANTUM_THEME_DIR/${theme}.kvconfig"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$KVANTUM_THEME_SYMLINK"
        echo "Symlink created for Kvantum: $theme_file -> $KVANTUM_THEME_SYMLINK"
        wait
    else
        echo "Error: Kvantum theme file $theme_file not found"
    fi
}

# Function to change all themes
change_all_themes() {
    local icon_theme="$1"
    local icon_theme="$2"
    local qt5_theme="$3"
    local qt6_theme="$4"
    local kvantum_theme="$5"
    
    change_qt5_icon "$icon_theme"
    change_qt6_icon "$icon_theme"
    change_qt5_theme "$qt5_theme"
    change_qt6_theme "$qt6_theme"
    change_kvantum_theme "$kvantum_theme"
    
    echo "All Qt theme changes have been applied."
}

case "$1" in
    -def|--default)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "Default" "Default" "Default"
        ;;
    -no|--nightowl)
        change_all_themes "Tela-circle-dracula" "Tela-circle-dracula" "NightOwl" "NightOwl" "NightOwl"
        ;;
    -d|--dracula)
        change_all_themes "Tela-circle-dracula" "Tela-circle-dracula" "Dracula" "Dracula" "Dracula"
        ;;
    -g|--gruv)
        change_all_themes "Gruvbox-Plus-Dark" "Gruvbox-Plus-Dark" "Gruv" "Gruv" "Gruv"
        ;;
    -n|--nord)
        change_all_themes "Zafiro-Nord-Black" "Zafiro-Nord-Black" "Nord" "Nord" "Nord"
        ;;
    -e|--everforest)
        change_all_themes "Nordzy-turquoise-dark" "Nordzy-turquoise-dark" "Everforest" "Everforest" "Everforest"
        ;;
    -b|--everblush)
        change_all_themes "BeautyDream" "BeautyDream" "Everblush" "Everblush" "Everblush"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "Gruvbox-Plus-Light" "Gruvbox-Plus-Light" "GruvboxLight" "GruvboxLight" "GruvboxLight"
        ;;
    -sl|--solarized-light)
        change_all_themes "Papirus-Light" "Papirus-Light" "SolarizedLight" "SolarizedLight" "SolarizedLight"
        ;;
    -z|--zenbones)
        change_all_themes "Papirus-Light" "Papirus-Light" "Zenbones" "Zenbones" "Zenbones"
        ;;
    -al|--alabaster)
        change_all_themes "Papirus-Light" "Papirus-Light" "Alabaster" "Alabaster" "Alabaster"
        ;;
    -p|--papercolor)
        change_all_themes "Papirus-Light" "Papirus-Light" "PaperColor" "PaperColor" "PaperColor"
        ;;
    -m|--modus)
        change_all_themes "Papirus-Light" "Papirus-Light" "Modus" "Modus" "Modus"
        ;;
    -tn|--tokyonight)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "TokyoNight" "TokyoNight" "TokyoNight"
        ;;
    -rp|--rosepine)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "RosePine" "RosePine" "RosePine"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "Papirus-Light" "Papirus-Light" "RosePineDawn" "RosePineDawn" "RosePineDawn"
        ;;
    -k|--kanagawa)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "Kanagawa" "Kanagawa" "Kanagawa"
        ;;
    -bl|--blossom)
        change_all_themes "Papirus-Light" "Papirus-Light" "Blossom" "Blossom" "Blossom"
        ;;
    -bld|--blossom-dark)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "BlossomDark" "BlossomDark" "BlossomDark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "Papirus-Light" "Papirus-Light" "CatppuccinLatte" "CatppuccinLatte" "CatppuccinLatte"
        ;;
    -sel|--selenized-light)
        change_all_themes "Papirus-Light" "Papirus-Light" "SelenizedLight" "SelenizedLight" "SelenizedLight"
        ;;
    -hf|--huggingface)
        change_all_themes "Papirus-Dark" "Papirus-Dark" "HuggingFace" "HuggingFace" "HuggingFace"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac
