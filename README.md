# Futura Aero Dotfiles

Minimalistyczny zestaw dotfiles do Hyprlanda w stylu Futura Aero: czyste kolory, przezroczystości, aero-glass look, wygodne skróty klawiszowe i szybka instalacja.

## Co zawiera

- Hyprland w stylu Aero
- Waybar jako taskbar / pasek statusu
- Kitty jako terminal
- Rofi jako launcher aplikacji
- Fastfetch jako system info
- Domyślna tapeta w błękitno-turkusowym stylu
- Instalator `install.sh` z obsługą Arch Linux

## Wymagania

- Arch Linux lub Ubuntu/Debian (instalator wspiera oba)
- Git
- curl / wget
- uruchomione środowisko Wayland

## Szybka instalacja

```bash
git clone https://github.com/pyreczka/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## Skróty klawiaturowe

### Podstawowe
- Super + Enter — otwórz terminal
- Super + A — launcher aplikacji (rofi)
- Super + Q — zamknij aktywne okno
- Super + L — blokada ekranu
- Super + W — zmień tapetę
- Super + M — wylogowanie / wyjście z Hyprlanda

### Okna i układ
- Super + F — pełny ekran
- Super + Spacja — przełącz tryb pływający
- Super + P — pseudo-tile
- Super + V — przełącz split

### Nawigacja
- Super + ← / → / ↑ / ↓ — focus między oknami
- Super + H / J / K / L — alternatywna nawigacja Vim

### Workspace'y
- Super + 1..9 — przełącz workspace
- Super + Shift + 1..9 — przenieś okno na workspace
- Super + Scroll — zmiana workspace

## Struktura repozytorium

```text
.
├── config/
│   ├── fastfetch/
│   │   ├── config.jsonc
│   │   └── README.md
│   ├── hypr/
│   │   ├── hyprland.lua
│   │   ├── hyprpaper.conf
│   │   └── wallpapers/
│   ├── kitty/
│   ├── rofi/
│   └── waybar/
├── wallpapers/
│   ├── default.svg
├── install.sh
├── README.md
└── LICENSE
```

## Tapeta

Domyślna tapeta jest umieszczona w:

```text
wallpapers/default.svg
```

Jest automatycznie kopiowana do katalogu konfiguracji Hyprlanda i podpięta przez `hyprpaper`.

## Fastfetch

Po instalacji można uruchomić:

```bash
fastfetch
```

## Dodatkowe informacje

- Instalator automatycznie przygotowuje katalogi `~/.config/...`
- Zabezpiecza istniejące konfiguracje poprzez backup
- Instaluje `yay` na Arch Linux z repo AUR
- Podłącza `curl` do pobierania tapety i dodatków

## Licencja

MIT

## Autor

pyreczka
