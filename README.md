# Arch Linux Hyprland Dotfiles

A comprehensive dotfiles repository for Arch Linux with Hyprland wayland compositor. This setup provides a complete, modern desktop environment with beautiful aesthetics and powerful functionality.

## System Information

- **OS**: Arch Linux (Rolling Release)
- **Window Manager**: Hyprland (Wayland)
- **Terminal**: Alacritty, Foot, Kitty
- **Shell**: Zsh with Oh-My-Zsh
- **Prompt**: Starship
- **Editor**: Neovim
- **Launcher**: Fuzzel
- **Notifications**: Dunst
- **Status Bar**: Waybar
- **System Monitor**: btop
- **File Manager**: Yazi
- **System Info**: Fastfetch

## Screenshots

(Add your screenshots here)

## Features

- **Hyprland Configuration**: Fully configured Hyprland with custom keybindings, window rules, and animations
- **Multiple Terminal Emulators**: Alacritty, Foot, and Kitty with matching themes
- **Enhanced Shell Experience**: Zsh with Oh-My-Zsh, syntax highlighting, autosuggestions, and vi-mode
- **Modern Tools**: Replaced traditional tools with modern alternatives
  - `ls` → `eza` (modern ls with icons)
  - `cat` → `bat` (syntax highlighting)
  - `find` → `fd`
  - File manager → `yazi`
- **Neovim Setup**: Full Neovim configuration with lazy.nvim
- **Customized Prompt**: Starship prompt with custom configuration
- **Notification System**: Dunst for desktop notifications
- **Status Bar**: Waybar with custom modules
- **System Monitoring**: btop for beautiful system monitoring

## Directory Structure

```
dotfiles/
├── .config/
│   ├── hypr/           # Hyprland configuration
│   ├── nvim/           # Neovim configuration
│   ├── alacritty/      # Alacritty terminal config
│   ├── foot/           # Foot terminal config
│   ├── kitty/          # Kitty terminal config
│   ├── fuzzel/         # Fuzzel launcher config
│   ├── dunst/          # Dunst notification config
│   ├── waybar/         # Waybar status bar config
│   ├── btop/           # btop system monitor config
│   ├── fastfetch/      # Fastfetch config
│   ├── yazi/           # Yazi file manager config
│   └── starship.toml   # Starship prompt config
├── home/
│   ├── .zshrc          # Zsh configuration
│   ├── .bashrc         # Bash configuration
│   └── .bash_profile   # Bash profile
├── scripts/
│   └── weather.sh      # Weather script
├── pkglist.txt         # List of installed packages
├── install.sh          # Installation script
└── README.md           # This file
```

## Installation

### Prerequisites

- Fresh Arch Linux installation
- Internet connection
- Git installed

### Quick Install

```bash
# Clone the repository
git clone https://github.com/raman164/dots-hypr.git ~/dotfiles
cd ~/dotfiles

# Run the installation script
./install.sh
```

The installation script will:
1. Update your system
2. Install all required packages from `pkglist.txt`
3. Install Oh-My-Zsh and plugins
4. Install Starship prompt
5. Backup your existing configurations to `~/.dotfiles_backup_TIMESTAMP`
6. Create symlinks for all configuration files
7. Set up the necessary directories
8. Change your default shell to zsh

### Manual Installation

If you prefer to install manually or want to cherry-pick configurations:

```bash
# Clone the repository
git clone https://github.com/raman164/dots-hypr.git ~/dotfiles
cd ~/dotfiles

# Install packages manually
sudo pacman -S - < <(awk '{print $1}' pkglist.txt)

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Create symlinks
ln -sf ~/dotfiles/home/.zshrc ~/.zshrc
ln -sf ~/dotfiles/home/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.config/* ~/.config/

# Change default shell
chsh -s $(which zsh)
```

## Key Bindings (Hyprland)

The Hyprland configuration includes many custom keybindings. Here are some of the most important ones:

(You can extract these from your hyprland.conf file and list them here)

## Post-Installation

After installation:

1. **Log out and log back in** for shell changes to take effect
2. **Restart Hyprland** or reboot your system
3. **Configure personal settings**:
   - Edit `~/.config/hypr/hyprland.conf` for Hyprland settings
   - Edit `~/.zshrc` for shell customizations
   - Edit `~/.config/nvim/` for Neovim settings
4. **Set up monitors**: Adjust monitor configuration in Hyprland config if needed
5. **Wallpaper**: Set your preferred wallpaper using `hyprpaper` or similar

## Customization

### Changing Themes

- **Terminal themes**: Located in `.config/alacritty/themes/`
- **Hyprland appearance**: Edit `.config/hypr/hyprland.conf`
- **GTK themes**: Configured via system settings

### Adding Aliases

Edit `~/.zshrc` and add your custom aliases at the end of the file.

### Modifying Keybindings

Edit `~/.config/hypr/hyprland.conf` to customize Hyprland keybindings.

## Package List

This setup includes 211 packages. The complete list is available in `pkglist.txt`.

### Key Packages Include:

- **Hyprland ecosystem**: hyprland, hyprlock, hyprpaper, hyprpicker
- **Terminal emulators**: alacritty, foot, kitty
- **Shell**: zsh, fish
- **Development**: git, neovim, various programming language tools
- **Media**: mpv, imv, ffmpeg
- **Utilities**: btop, eza, fzf, yazi, bat, and more

## Backup

The installation script automatically creates a backup of your existing configuration in:
```
~/.dotfiles_backup_TIMESTAMP/
```

## Troubleshooting

### Hyprland won't start
- Check logs: `cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 1)/hyprland.log`
- Ensure all required packages are installed
- Check your GPU drivers are properly installed

### Plugins not loading in Zsh
- Ensure Oh-My-Zsh is installed
- Check that plugins are cloned in `~/.oh-my-zsh/custom/plugins/`
- Reload zsh: `source ~/.zshrc`

### Neovim issues
- Run `:checkhealth` in Neovim
- Ensure all dependencies are installed
- Try reinstalling plugins: `:Lazy sync`

## Updating

To update the dotfiles:

```bash
cd ~/dotfiles
git pull origin main
```

Since configurations are symlinked, changes will be applied automatically. You may need to restart applications for changes to take effect.

## Contributing

Feel free to fork this repository and make it your own! If you have suggestions or improvements, pull requests are welcome.

## Credits

- [Hyprland](https://hyprland.org/)
- [Oh-My-Zsh](https://ohmyz.sh/)
- [Starship](https://starship.rs/)
- [Neovim](https://neovim.io/)
- And all the amazing open-source projects that make this setup possible

## License

This dotfiles repository is free to use and modify. Feel free to use it as a base for your own configuration.

## Notes

- This configuration is tailored for Arch Linux. It may need adjustments for other distributions.
- Some applications may require additional configuration based on your hardware.
- Always review scripts before running them, especially when they modify system configurations.
- Keep your system updated: `sudo pacman -Syu`

## Contact

If you have questions or need help, feel free to open an issue on GitHub.

---

**Enjoy your Arch Linux Hyprland setup!**
