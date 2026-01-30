#!/bin/bash


# Hyprland theme files
HYPR_THEME_DIR="$HOME/.config/hypr/themes"
HYPR_THEME_SYMLINK="$HOME/.config/hypr/themes/theme.conf"

# GTK 4 theme location
GTK4_TARGET="$HOME/.config/gtk-4.0"

# Function to change the Hyprland theme
change_hypr_theme() {
    local theme="$1"
    local theme_file="$HYPR_THEME_DIR/${theme}.conf"
    if [ -f "$theme_file" ]; then
        ln -sf "$theme_file" "$HYPR_THEME_SYMLINK"
        echo "Changed Hyprland theme to $theme"
        hyprctl reload
    else
        echo "Error: Hyprland theme file $theme_file not found"
    fi
}

# Function to change GTK4 theme
change_gtk4_theme() {
    local theme="$1"
    local gtk4_source=""

    case "$theme" in
        "Default")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0"
            ;;
        "NightOwl")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0"
            ;;
        "Nord")
            gtk4_source="$HOME/.themes/Nordic-darker/gtk-4.0"
            ;;
        "Dracula")
            gtk4_source="$HOME/.themes/Dracula/gtk-4.0"
            ;;
        "Gruvbox")
            gtk4_source="$HOME/.themes/Gruvbox-Dark-BL-MOD/gtk-4.0"
            ;;
        "Everforest")
            gtk4_source="$HOME/.themes/Catppuccin-Macchiato-Standard-Blue-Dark/gtk-4.0"
            ;;
        "Everblush")
            gtk4_source="$HOME/.themes/Catppuccin-Frappe-Standard-Blue-Dark/gtk-4.0"
            ;;
        "GruvboxLight")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "SolarizedLight")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "Zenbones")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "Alabaster")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "PaperColor")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "Modus")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "TokyoNight")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0"
            ;;
        "RosePine")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0"
            ;;
        "RosePineDawn")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "Kanagawa")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Blue-Dark/gtk-4.0"
            ;;
        "Blossom")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Peach-Light/gtk-4.0"
            ;;
        "BlossomDark")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Peach-Dark/gtk-4.0"
            ;;
        "CatppuccinLatte")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "SelenizedLight")
            gtk4_source="$HOME/.themes/Catppuccin-Latte-Standard-Blue-Light/gtk-4.0"
            ;;
        "HuggingFace")
            gtk4_source="$HOME/.themes/Catppuccin-Mocha-Standard-Yellow-Dark/gtk-4.0"
            ;;
        *)
            echo "Error: Unknown theme $theme"
            return 1
            ;;
    esac

    if [ -d "$gtk4_source" ]; then
        ln -sfn "$gtk4_source" "$GTK4_TARGET"
        echo "Changed GTK4 theme to $theme"
    else
        echo "Error: GTK4 theme directory $gtk4_source not found"
        return 1
    fi
}

# Function to change GTK theme via gsettings (runs immediately, not just at Hyprland startup)
change_gtk_gsettings() {
    local theme="$1"
    local gtk_theme=""
    local icon_theme=""
    local color_scheme=""

    case "$theme" in
        "Default")
            gtk_theme="Catppuccin-Mocha-Standard-Blue-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        "NightOwl")
            gtk_theme="Catppuccin-Mocha-Standard-Blue-Dark"
            icon_theme="Tela-circle-dracula"
            color_scheme="prefer-dark"
            ;;
        "Dracula")
            gtk_theme="Dracula"
            icon_theme="Tela-circle-dracula"
            color_scheme="prefer-dark"
            ;;
        "Nord")
            gtk_theme="Nordic-darker"
            icon_theme="Zafiro-Nord-Black"
            color_scheme="prefer-dark"
            ;;
        "Gruvbox")
            gtk_theme="Gruvbox-Dark-BL-MOD"
            icon_theme="Gruvbox-Plus-Dark"
            color_scheme="prefer-dark"
            ;;
        "Everforest")
            gtk_theme="Catppuccin-Macchiato-Standard-Blue-Dark"
            icon_theme="Nordzy-turquoise-dark"
            color_scheme="prefer-dark"
            ;;
        "Everblush")
            gtk_theme="Catppuccin-Frappe-Standard-Blue-Dark"
            icon_theme="BeautyDream"
            color_scheme="prefer-dark"
            ;;
        "GruvboxLight")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Gruvbox-Plus-Light"
            color_scheme="prefer-light"
            ;;
        "SolarizedLight")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "Zenbones")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "Alabaster")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "PaperColor")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "Modus")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "TokyoNight")
            gtk_theme="Catppuccin-Mocha-Standard-Blue-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        "RosePine")
            gtk_theme="Catppuccin-Mocha-Standard-Blue-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        "RosePineDawn")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "Kanagawa")
            gtk_theme="Catppuccin-Mocha-Standard-Blue-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        "Blossom")
            gtk_theme="Catppuccin-Latte-Standard-Peach-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "BlossomDark")
            gtk_theme="Catppuccin-Mocha-Standard-Peach-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        "CatppuccinLatte")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "SelenizedLight")
            gtk_theme="Catppuccin-Latte-Standard-Blue-Light"
            icon_theme="Papirus-Light"
            color_scheme="prefer-light"
            ;;
        "HuggingFace")
            gtk_theme="Catppuccin-Mocha-Standard-Yellow-Dark"
            icon_theme="Papirus-Dark"
            color_scheme="prefer-dark"
            ;;
        *)
            echo "Error: Unknown theme $theme for gsettings"
            return 1
            ;;
    esac

    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
    gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"
    gsettings set org.gnome.desktop.interface color-scheme "$color_scheme"
    echo "Applied GTK settings: theme=$gtk_theme, icons=$icon_theme, color-scheme=$color_scheme"
}

# Function to change all themes
change_all_themes() {
    local hypr_theme="$1"
    local gtk4_theme="$2"

    change_hypr_theme "$hypr_theme"
    change_gtk4_theme "$gtk4_theme"
    change_gtk_gsettings "$gtk4_theme"

    # Ensure all changes are written and applied
    sync
    echo "All theme changes have been applied and written to disk."
}


case "$1" in
    -def|--default)
        change_all_themes "Default" "Default"
        ;;
    -no|--nightowl)
        change_all_themes "NightOwl" "NightOwl"
        ;;
    -d|--dracula)
        change_all_themes "Dracula" "Dracula"
        ;;
    -g|--gruv)
        change_all_themes "Gruv" "Gruvbox"
        ;;
    -n|--nord)
        change_all_themes "Nord" "Nord"
        ;;
    -e|--everforest)
        change_all_themes "Everforest" "Everforest"
        ;;
    -b|--everblush)
        change_all_themes "Everblush" "Everblush"
        ;;
    -gl|--gruvbox-light)
        change_all_themes "GruvboxLight" "GruvboxLight"
        ;;
    -sl|--solarized-light)
        change_all_themes "SolarizedLight" "SolarizedLight"
        ;;
    -z|--zenbones)
        change_all_themes "Zenbones" "Zenbones"
        ;;
    -al|--alabaster)
        change_all_themes "Alabaster" "Alabaster"
        ;;
    -p|--papercolor)
        change_all_themes "PaperColor" "PaperColor"
        ;;
    -m|--modus)
        change_all_themes "Modus" "Modus"
        ;;
    -tn|--tokyonight)
        change_all_themes "TokyoNight" "TokyoNight"
        ;;
    -rp|--rosepine)
        change_all_themes "RosePine" "RosePine"
        ;;
    -rpd|--rosepine-dawn)
        change_all_themes "RosePineDawn" "RosePineDawn"
        ;;
    -k|--kanagawa)
        change_all_themes "Kanagawa" "Kanagawa"
        ;;
    -bl|--blossom)
        change_all_themes "Blossom" "Blossom"
        ;;
    -bld|--blossom-dark)
        change_all_themes "BlossomDark" "BlossomDark"
        ;;
    -cl|--catppuccin-latte)
        change_all_themes "CatppuccinLatte" "CatppuccinLatte"
        ;;
    -sel|--selenized-light)
        change_all_themes "SelenizedLight" "SelenizedLight"
        ;;
    -hf|--huggingface)
        change_all_themes "HuggingFace" "HuggingFace"
        ;;
    *)
        echo "Usage: $0 [theme-flag]"
        exit 1
        ;;
esac

# Updating nwg-look(This will update gtk2 and gtk3)
echo "Updating nwg-look..."
nwg-look -x
