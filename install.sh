#!/bin/bash

# Futura Aero Dotfiles Installer
# Hyprland + Waybar + Kitty + Rofi Setup

set -e

echo "╔════════════════════════════════════════╗"
echo "║  Futura Aero Dotfiles Installer v1.0   ║"
echo "╚════════════════════════════════════════╝"
echo ""

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

sudo -v

echo -e "${YELLOW}[*] Checking dependencies...${NC}"

if command -v pacman &> /dev/null; then
    echo -e "${GREEN}[✓] Arch Linux detected${NC}"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed \
        hyprland hyprpaper hyprcursor \
        waybar \
        kitty \
        rofi \
        swww \
        curl wget \
        base-devel git \
        fastfetch

    if ! command -v yay &> /dev/null; then
        echo -e "${YELLOW}[*] Installing yay AUR helper...${NC}"
        rm -rf /tmp/yay-install 2>/dev/null || true
        mkdir -p /tmp/yay-install
        cd /tmp/yay-install
        git clone https://aur.archlinux.org/yay.git 2>&1 || { echo -e "${RED}[✗] Failed to clone yay${NC}"; exit 1; }
        cd yay
        makepkg -si --noconfirm 2>&1 || { echo -e "${RED}[✗] Failed to build yay${NC}"; exit 1; }
        cd ~
        rm -rf /tmp/yay-install
        echo -e "${GREEN}[✓] yay installed successfully${NC}"
    else
        echo -e "${GREEN}[✓] yay already installed${NC}"
    fi

elif command -v apt &> /dev/null; then
    echo -e "${GREEN}[✓] Debian/Ubuntu detected${NC}"
    sudo apt update
    sudo apt install -y \
        hyprland hyprpaper \
        waybar \
        kitty \
        rofi \
        swww \
        curl wget \
        build-essential git \
        fastfetch
    echo -e "${YELLOW}[!] Note: yay is Arch Linux only. Install an AUR helper manually if needed.${NC}"
else
    echo -e "${RED}[✗] Unsupported distro. Please install packages manually.${NC}"
    exit 1
fi

echo -e "${GREEN}[✓] Core packages installed${NC}"
echo ""

echo -e "${YELLOW}[*] Creating directories...${NC}"
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/kitty/themes
mkdir -p ~/.config/rofi
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/hypr/wallpapers
echo -e "${GREEN}[✓] Directories created${NC}"
echo ""

echo -e "${YELLOW}[*] Backing up existing configs...${NC}"
for dir in hypr waybar kitty rofi fastfetch; do
    if [ -d "$HOME/.config/$dir" ] && [ ! -z "$(ls -A "$HOME/.config/$dir" 2>/dev/null)" ]; then
        echo -e "${YELLOW}[!] Backing up ~/.config/$dir${NC}"
        mv "$HOME/.config/$dir" "$HOME/.config/${dir}.backup.$(date +%s)"
    fi
done
echo -e "${GREEN}[✓] Backups created${NC}"
echo ""

echo -e "${YELLOW}[*] Installing configurations...${NC}"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -d "$DOTFILES_DIR/config/hypr" ]; then
    cp -r "$DOTFILES_DIR/config/hypr"/* ~/.config/hypr/
    echo -e "${GREEN}[✓] Hyprland config installed${NC}"
fi

if [ -d "$DOTFILES_DIR/config/waybar" ]; then
    cp -r "$DOTFILES_DIR/config/waybar"/* ~/.config/waybar/
    echo -e "${GREEN}[✓] Waybar config installed${NC}"
fi

if [ -d "$DOTFILES_DIR/config/kitty" ]; then
    cp -r "$DOTFILES_DIR/config/kitty"/* ~/.config/kitty/
    echo -e "${GREEN}[✓] Kitty config installed${NC}"
fi

if [ -d "$DOTFILES_DIR/config/rofi" ]; then
    cp -r "$DOTFILES_DIR/config/rofi"/* ~/.config/rofi/
    echo -e "${GREEN}[✓] Rofi config installed${NC}"
fi

if [ -d "$DOTFILES_DIR/config/fastfetch" ]; then
    cp -r "$DOTFILES_DIR/config/fastfetch"/* ~/.config/fastfetch/
    echo -e "${GREEN}[✓] Fastfetch config installed${NC}"
fi

if [ -f "$DOTFILES_DIR/wallpapers/default.svg" ]; then
    cp "$DOTFILES_DIR/wallpapers/default.svg" ~/.config/hypr/wallpapers/default.svg
    echo -e "${GREEN}[✓] Wallpaper installed${NC}"
fi

chmod +x ~/.config/hypr/scripts/*.sh 2>/dev/null || true

echo -e "${GREEN}[✓] All configurations installed${NC}"
echo ""

echo -e "${BLUE}[*] Testing fastfetch...${NC}"
if command -v fastfetch &> /dev/null; then
    fastfetch
fi
echo ""

echo -e "${GREEN}╔════════════════════════════════════════╗"
echo -e "║  Installation complete!                 ║"
echo -e "║  Press SUPER+Enter to start Hyprland   ║"
echo -e "╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Log out and select Hyprland in your login manager"
echo -e "  2. Use SUPER+A to open rofi application launcher"
echo -e "  3. Use SUPER+Enter to open kitty terminal"
echo -e "  4. Run 'fastfetch' to see your new system info"
echo ""
echo -e "${BLUE}Installed packages:${NC}"
echo -e "  - Hyprland (Window Manager)"
echo -e "  - Waybar (Status Bar)"
echo -e "  - Kitty (Terminal)"
echo -e "  - Rofi (Application Launcher)"
echo -e "  - Fastfetch (System Info)"
echo -e "  - yay (AUR Helper)"
echo ""
