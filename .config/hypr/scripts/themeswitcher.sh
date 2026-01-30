#!/bin/bash

declare -A THEMES=(
    ["   Default"]="~/.config/hypr/scripts/switchmaster.sh -def"
    ["󰄛   Night Owl"]="~/.config/hypr/scripts/switchmaster.sh -no"
    ["󰺹   Dracula"]="~/.config/hypr/scripts/switchmaster.sh -d"
    ["󱄆   Nord"]="~/.config/hypr/scripts/switchmaster.sh -n"
    ["󱁕   Everforest"]="~/.config/hypr/scripts/switchmaster.sh -e"
    ["   Gruvbox"]="~/.config/hypr/scripts/switchmaster.sh -g"
    ["   Everblush"]="~/.config/hypr/scripts/switchmaster.sh -b"
    ["   Tokyo Night"]="~/.config/hypr/scripts/switchmaster.sh -tn"
    ["󰧭   Rose Pine"]="~/.config/hypr/scripts/switchmaster.sh -rp"
    ["󰖨   Rose Pine Dawn"]="~/.config/hypr/scripts/switchmaster.sh -rpd"
    ["󰊠   Kanagawa"]="~/.config/hypr/scripts/switchmaster.sh -k"
    ["󰖨   Gruvbox Light"]="~/.config/hypr/scripts/switchmaster.sh -gl"
    ["󰖨   Solarized Light"]="~/.config/hypr/scripts/switchmaster.sh -sl"
    ["󰖨   Zenbones"]="~/.config/hypr/scripts/switchmaster.sh -z"
    ["󰖨   Alabaster"]="~/.config/hypr/scripts/switchmaster.sh -al"
    ["󰖨   PaperColor"]="~/.config/hypr/scripts/switchmaster.sh -p"
    ["󰖨   Modus"]="~/.config/hypr/scripts/switchmaster.sh -m"
    ["󰖨   Blossom"]="~/.config/hypr/scripts/switchmaster.sh -bl"
    ["   Blossom Dark"]="~/.config/hypr/scripts/switchmaster.sh -bld"
    ["󰖨   Catppuccin Latte"]="~/.config/hypr/scripts/switchmaster.sh -cl"
    ["󰖨   Selenized Light"]="~/.config/hypr/scripts/switchmaster.sh -sel"
    ["🤗   Hugging Face"]="~/.config/hypr/scripts/switchmaster.sh -hf"
)

theme_names=$(printf "%s\n" "${!THEMES[@]}")
selected=$(echo -e "$theme_names" | wofi --dmenu -i -p "Select Theme")
if [ -n "$selected" ]; then
    command="${THEMES[$selected]}"

    if [ -n "$command" ]; then
        eval "$command"
        notify-send "Theme Changed" "Switched to $selected theme"
    fi
fi
