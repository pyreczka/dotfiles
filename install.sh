#!/bin/bash

# Futura Aero Dotfiles Installer
# Hyprland + Waybar + Kitty + Rofi Setup

set -e

echo "╔════════════════════════════════════════╗"
echo "║  Futura Aero Dotfiles Installer v1.0   ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if running with sudo or will ask for password
sudo -v

echo -e "${YELLOW}[*] Checking dependencies...${NC}"

# Detect distro and install packages
if command -v pacman &> /dev/null; then
    echo -e "${GREEN}[✓] Arch Linux detected${NC}"
    echo -e "${YELLOW}[*] Updating system...${NC}"
    sudo pacman -Syu --noconfirm
    
    echo -e "${YELLOW}[*] Installing core packages...${NC}"
    sudo pacman -S --noconfirm --needed \
        hyprland hyprpaper hyprcursor \
        waybar \
        kitty \
        rofi \
        swww \
        curl wget \
        base-devel git \
        fastfetch
    
    # Install yay AUR helper
    if ! command -v yay &> /dev/null; then
        echo -e "${YELLOW}[*] Installing yay AUR helper...${NC}"
        mkdir -p /tmp/yay-install
        cd /tmp/yay-install
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay-install
        echo -e "${GREEN}[✓] yay installed successfully${NC}"
    else
        echo -e "${GREEN}[✓] yay already installed${NC}"
    fi
    
elif command -v apt &> /dev/null; then
    echo -e "${GREEN}[✓] Debian/Ubuntu detected${NC}"
    echo -e "${YELLOW}[*] Updating system...${NC}"
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

# Create necessary directories
echo -e "${YELLOW}[*] Creating directories...${NC}"
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/kitty/themes
mkdir -p ~/.config/rofi
mkdir -p ~/.config/fastfetch
mkdir -p ~/.config/hypr/wallpapers
echo -e "${GREEN}[✓] Directories created${NC}"
echo ""

# Backup existing configs
echo -e "${YELLOW}[*] Backing up existing configs...${NC}"
for dir in hypr waybar kitty rofi fastfetch; do
    if [ -d "$HOME/.config/$dir" ] && [ ! -z "$(ls -A $HOME/.config/$dir 2>/dev/null)" ]; then
        echo -e "${YELLOW}[!] Backing up ~/.config/$dir${NC}"
        mv "$HOME/.config/$dir" "$HOME/.config/${dir}.backup.$(date +%s)"
    fi
done
echo -e "${GREEN}[✓] Backups created${NC}"
echo ""

# Get the dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy configs
echo -e "${YELLOW}[*] Installing configurations...${NC}"
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

echo -e "${GREEN}[✓] All configurations installed${NC}"
echo ""

# Set permissions
echo -e "${YELLOW}[*] Setting permissions...${NC}"
chmod +x ~/.config/hypr/scripts/*.sh 2>/dev/null || true
echo -e "${GREEN}[✓] Permissions set${NC}"
echo ""

# Download wallpapers (optional)
echo -e "${YELLOW}[?] Download wallpapers? (y/n)${NC}"
read -r download_wallpapers
if [[ $download_wallpapers == "y" ]]; then
    echo -e "${YELLOW}[*] Downloading wallpapers...${NC}"
    if command -v curl &> /dev/null; then
        curl -L "https://raw.githubusercontent.com/pyreczka/dotfiles/main/wallpapers/default.png" -o ~/.config/hypr/wallpapers/default.png 2>/dev/null && \
        echo -e "${GREEN}[✓] Wallpapers downloaded${NC}" || \
        echo -e "${YELLOW}[!] Wallpaper download failed, using placeholder${NC}"
    else
        echo -e "${RED}[✗] curl not found, skipping wallpaper download${NC}"
    fi
fi
echo ""

# Test fastfetch
echo -e "${BLUE}[*] Testing fastfetch...${NC}"
if command -v fastfetch &> /dev/null; then
    fastfetch
fi
echo ""

# Final message
echo -e "${GREEN}╔════════════════════════════════════════╗"
echo -e "║  Installation complete!                 ║"
echo -e "║  Press SUPER+Enter to start Hyprland   ║"
echo -e "╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo -e "  1. Log out and select Hyprland in your login manager"
echo -e "  2. Use SUPER+A to open rofi application launcher"
echo -e "  3. Use SUPER+Enter to open kitty terminal"
echo -e "  4. Edit ~/.config/hypr/hyprland.conf to customize"
echo -e "  5. Run 'fastfetch' to see your new system info"
echo ""
echo -e "${BLUE}Installed packages:${NC}"
echo -e "  - Hyprland (Window Manager)"
echo -e "  - Waybar (Status Bar)"
echo -e "  - Kitty (Terminal)"
echo -e "  - Rofi (Application Launcher)"
echo -e "  - Fastfetch (System Info)"
echo -e "  - yay (AUR Helper)"
echo ""
