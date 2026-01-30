#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 [-d|--dracula] [-g|--gruv] [-n|--nord] [-e|--everforest] [-b|--everblush] [-gl|--gruvbox-light] [-sl|--solarized-light] [-z|--zenbones] [-al|--alabaster] [-p|--papercolor] [-m|--modus]"
    exit 1
fi

# Function to execute all scripts with the given argument
execute_all_scripts() {
    local arg="$1"
    
    # Importing all theme switching scripts
    scripts=(
        "$HOME/.config/hypr/scripts/switch1.sh"
        "$HOME/.config/hypr/scripts/switch2.sh"
        "$HOME/.config/hypr/scripts/switch3.sh"
        "$HOME/.config/hypr/scripts/switch4.sh"
        "$HOME/.config/hypr/scripts/switch5.sh"
        "$HOME/.config/hypr/scripts/switch6.sh"
        "$HOME/.config/hypr/scripts/switch7.sh"
        
    )

    # Execute each script with the provided argument
    for script in "${scripts[@]}"; do
        if [ -f "$script" ]; then
            echo "Executing $script $arg"
            bash "$script" "$arg"
        else
            echo "Warning: $script not found"
        fi
    done
}

# Argument
case "$1" in
    -def|--default)
        execute_all_scripts "-def"
        ;;
    -no|--nightowl)
        execute_all_scripts "-no"
        ;;
    -d|--dracula)
        execute_all_scripts "-d"
        ;;
    -g|--gruv)
        execute_all_scripts "-g"
        ;;
    -n|--nord)
        execute_all_scripts "-n"
        ;;
    -e|--everforest)
        execute_all_scripts "-e"
        ;;
    -b|--everblush)
        execute_all_scripts "-b"
        ;;
    -gl|--gruvbox-light)
        execute_all_scripts "-gl"
        ;;
    -sl|--solarized-light)
        execute_all_scripts "-sl"
        ;;
    -z|--zenbones)
        execute_all_scripts "-z"
        ;;
    -al|--alabaster)
        execute_all_scripts "-al"
        ;;
    -p|--papercolor)
        execute_all_scripts "-p"
        ;;
    -m|--modus)
        execute_all_scripts "-m"
        ;;
    -tn|--tokyonight)
        execute_all_scripts "-tn"
        ;;
    -rp|--rosepine)
        execute_all_scripts "-rp"
        ;;
    -rpd|--rosepine-dawn)
        execute_all_scripts "-rpd"
        ;;
    -k|--kanagawa)
        execute_all_scripts "-k"
        ;;
    -bl|--blossom)
        execute_all_scripts "-bl"
        ;;
    -bld|--blossom-dark)
        execute_all_scripts "-bld"
        ;;
    -cl|--catppuccin-latte)
        execute_all_scripts "-cl"
        ;;
    -sel|--selenized-light)
        execute_all_scripts "-sel"
        ;;
    -hf|--huggingface)
        execute_all_scripts "-hf"
        ;;
    *)
        echo "Invalid argument. Run with a theme flag."
        exit 1
        ;;
esac

echo "All theme changes have been applied."

