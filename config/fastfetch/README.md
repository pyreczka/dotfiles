# Fastfetch Configuration

Catppuccin Mocha themed system information display.

## Installation

The configuration is automatically installed by `install.sh`.

To manually apply it:
```bash
cp config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
```

## Usage

Simply run:
```bash
fastfetch
```

Or for a minimal display:
```bash
fastfetch --config config.jsonc
```

## Customization

Edit `~/.config/fastfetch/config.jsonc` to:
- Change logo (Arch, Fedora, Ubuntu, etc.)
- Add/remove modules
- Customize colors
- Adjust formatting

## Modules Available

- `title` - User@Hostname
- `os` - Operating System
- `kernel` - Kernel version
- `uptime` - System uptime
- `shell` - Current shell
- `wm` - Window Manager
- `terminal` - Terminal emulator
- `cpu` - CPU info with temperature
- `gpu` - GPU info
- `memory` - RAM usage
- `disk` - Disk usage
- `colors` - Color palette
