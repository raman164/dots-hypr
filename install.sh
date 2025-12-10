#!/bin/bash

# Arch Linux Hyprland Dotfiles Installation Script
# This script will install all necessary packages and set up configuration files

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    print_error "This script is designed for Arch Linux only!"
    exit 1
fi

print_info "Starting Arch Linux Hyprland dotfiles installation..."

# Update system
print_info "Updating system..."
sudo pacman -Syu --noconfirm

# Install packages from pkglist.txt
print_info "Installing packages from pkglist.txt..."
print_warning "This will install $(wc -l < pkglist.txt) packages. This may take a while."

read -p "Do you want to install all packages? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Extract package names from pkglist.txt (format: "package version")
    awk '{print $1}' pkglist.txt > /tmp/packages_to_install.txt

    # Install packages
    sudo pacman -S --needed --noconfirm - < /tmp/packages_to_install.txt || {
        print_warning "Some packages failed to install. Continuing anyway..."
    }
    print_success "Package installation completed"
else
    print_info "Skipping package installation"
fi

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_info "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "oh-my-zsh installed"
else
    print_info "oh-my-zsh already installed"
fi

# Install zsh plugins
print_info "Installing zsh plugins..."
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-vi-mode
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-vi-mode" ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode "$ZSH_CUSTOM/plugins/zsh-vi-mode"
fi

# zsh-256color
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-256color" ]; then
    git clone https://github.com/chrissicool/zsh-256color "$ZSH_CUSTOM/plugins/zsh-256color"
fi

print_success "Zsh plugins installed"

# Install Starship prompt if not already installed
if ! command -v starship &> /dev/null; then
    print_info "Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    print_success "Starship installed"
else
    print_info "Starship already installed"
fi

# Backup existing configs
print_info "Backing up existing configurations..."
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup home dotfiles
for file in .zshrc .bashrc .bash_profile; do
    if [ -f "$HOME/$file" ]; then
        cp "$HOME/$file" "$BACKUP_DIR/"
        print_info "Backed up $file"
    fi
done

# Backup .config directories
for dir in hypr nvim alacritty dunst foot fuzzel btop fastfetch yazi waybar kitty; do
    if [ -d "$HOME/.config/$dir" ]; then
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        print_info "Backed up .config/$dir"
    fi
done

if [ -f "$HOME/.config/starship.toml" ]; then
    cp "$HOME/.config/starship.toml" "$BACKUP_DIR/"
fi

print_success "Backup completed at $BACKUP_DIR"

# Create symlinks
print_info "Creating symlinks..."

# Link home dotfiles
ln -sf "$(pwd)/home/.zshrc" "$HOME/.zshrc"
ln -sf "$(pwd)/home/.bashrc" "$HOME/.bashrc"
if [ -f "$(pwd)/home/.bash_profile" ]; then
    ln -sf "$(pwd)/home/.bash_profile" "$HOME/.bash_profile"
fi

# Link .config directories
mkdir -p "$HOME/.config"
for dir in hypr nvim alacritty dunst foot fuzzel btop fastfetch yazi waybar kitty; do
    if [ -d "$(pwd)/.config/$dir" ]; then
        ln -sf "$(pwd)/.config/$dir" "$HOME/.config/"
        print_info "Linked .config/$dir"
    fi
done

# Link starship config
if [ -f "$(pwd)/.config/starship.toml" ]; then
    ln -sf "$(pwd)/.config/starship.toml" "$HOME/.config/starship.toml"
fi

# Link scripts
if [ -d "$(pwd)/scripts" ]; then
    mkdir -p "$HOME/bin"
    for script in $(pwd)/scripts/*; do
        if [ -f "$script" ]; then
            ln -sf "$script" "$HOME/$(basename $script)"
            chmod +x "$HOME/$(basename $script)"
        fi
    done
fi

print_success "Symlinks created"

# Change default shell to zsh if not already
if [ "$SHELL" != "$(which zsh)" ]; then
    print_info "Changing default shell to zsh..."
    chsh -s $(which zsh)
    print_success "Default shell changed to zsh. Please log out and log back in for changes to take effect."
fi

print_success "Installation completed!"
print_info "Please log out and log back in to apply all changes."
print_info "You may need to restart Hyprland or reboot your system."
