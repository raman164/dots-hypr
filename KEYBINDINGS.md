# Hyprland Keybindings

This document lists all custom keybindings configured in this Hyprland setup.

**Main Modifier Key:** `SUPER` (Windows/Command key)

## Applications & Programs

| Keybinding | Action |
|------------|--------|
| `SUPER + Return` | Open terminal (foot) |
| `SUPER + B` | Open Firefox browser |
| `SUPER + E` | Open file manager (Thunar) |
| `SUPER + Space` | Open fuzzel launcher |
| `SUPER + D` | Open wofi launcher |
| `SUPER + SHIFT + P` | Open PavuControl (audio settings) |

## Window Management

| Keybinding | Action |
|------------|--------|
| `SUPER + Q` | Kill active window |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + V` | Toggle floating mode |
| `SUPER + P` | Pseudo-tile (dwindle) |
| `SUPER + U` | Toggle split (dwindle) |
| `CTRL + ALT + Delete` | Exit Hyprland |

## Window Focus (Vim Keys)

| Keybinding | Action |
|------------|--------|
| `SUPER + h` | Move focus left |
| `SUPER + l` | Move focus right |
| `SUPER + k` | Move focus up |
| `SUPER + j` | Move focus down |

## Window Focus (Arrow Keys)

| Keybinding | Action |
|------------|--------|
| `SUPER + Left` | Move focus left |
| `SUPER + Right` | Move focus right |
| `SUPER + Up` | Move focus up |
| `SUPER + Down` | Move focus down |

## Move Windows (Vim Keys)

| Keybinding | Action |
|------------|--------|
| `SUPER + SHIFT + H` | Move window left |
| `SUPER + SHIFT + L` | Move window right |
| `SUPER + SHIFT + K` | Move window up |
| `SUPER + SHIFT + J` | Move window down |

## Workspaces

| Keybinding | Action |
|------------|--------|
| `SUPER + 1-9` | Switch to workspace 1-9 |
| `SUPER + 0` | Switch to workspace 10 |
| `SUPER + Mouse Scroll Up` | Next workspace |
| `SUPER + Mouse Scroll Down` | Previous workspace |

## Move Windows to Workspaces

| Keybinding | Action |
|------------|--------|
| `SUPER + SHIFT + 1-9` | Move active window to workspace 1-9 |
| `SUPER + SHIFT + 0` | Move active window to workspace 10 |

## Mouse Actions

| Keybinding | Action |
|------------|--------|
| `SUPER + Left Click (drag)` | Move window |
| `SUPER + Right Click (drag)` | Resize window |

## Screenshots

| Keybinding | Action |
|------------|--------|
| `SUPER + ALT + S` | Screenshot entire screen (save & copy to clipboard) |
| `SUPER + SHIFT + S` | Screenshot selection (save & copy to clipboard) |

Screenshots are saved to `~/Pictures/sc/` with timestamp.

## Appearance & Customization

| Keybinding | Action |
|------------|--------|
| `SUPER + S` | Open waybar theme switcher |
| `SUPER + R` | Switch foot terminal theme |
| `SUPER + SHIFT + W` | Restart waybar |
| `SUPER + CTRL + W` | Open waypaper (wallpaper selector) |

## Media Controls

| Keybinding | Action |
|------------|--------|
| `XF86AudioPlay` | Play/Pause media |
| `XF86AudioPause` | Pause media |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86AudioRaiseVolume` | Increase volume |
| `XF86AudioLowerVolume` | Decrease volume |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle microphone mute |

## Brightness

| Keybinding | Action |
|------------|--------|
| `XF86MonBrightnessUp` | Increase brightness |
| `XF86MonBrightnessDown` | Decrease brightness |

## Special Function Keys

| Keybinding | Action |
|------------|--------|
| `XF86Calculator` | Open calculator (qalculate-gtk) |
| `XF86Lock` | Lock screen (hyprlock) |

## Configuration Files

- Main config: `~/.config/hypr/hyprland.conf`
- Keybindings: `~/.config/hypr/shortcuts.conf`
- Window rules: `~/.config/hypr/windows.conf`

## Notes

- All keybindings can be customized by editing `~/.config/hypr/shortcuts.conf`
- Screenshots require `grim`, `slurp`, and `wl-copy` to be installed
- Media controls work with `playerctl`
- Volume and brightness controls use custom scripts
