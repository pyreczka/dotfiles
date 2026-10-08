-- Futura Aero Hyprland config (Lua)
-- Minimal, glassy, futuristic look

monitor = ",preferred,auto,1"

exec = [
  "waybar",
  "hyprpaper",
  "swww init",
]

-- General behavior
general = {
  gaps_in = 8,
  gaps_out = 12,
  border_size = 2,
  "col.active_border" = "rgba(c9b0eeff) rgba(89b4faff) 45deg",
  "col.inactive_border" = "rgba(45475aff)",
  layout = "dwindle",
  no_cursor_warps = true,
}

decoration = {
  rounding = 8,
  blur = {
    enabled = true,
    size = 4,
    passes = 2,
    new_optimizations = true,
  },
  shadow = {
    enabled = true,
    range = 12,
    render_power = 3,
    color = "rgba(1e1e2e99)",
  },
}

animations = {
  enabled = true,
  animation = {
    "windows, 1, 5, default, popin 80%",
    "windowsOut, 1, 5, default, popin 80%",
    "fade, 1, 10, default",
    "border, 1, 10, default",
    "workspaces, 1, 5, default, slidefadevert 20%",
  },
}

dwindle = {
  pseudotile = true,
  preserve_split = true,
}

master = {
  new_is_master = true,
}

input = {
  kb_layout = "pl",
  kb_variant = "",
  kb_model = "",
  kb_options = "compose:ralt",
  follow_mouse = 1,
  sensitivity = 0,
  touchpad = {
    natural_scroll = false,
  },
}

windowrule = {
  "float,^(pavucontrol)$",
  "float,^(blueman-manager)$",
  "float,^(nm-connection-editor)$",
  "opacity 0.95,^(kitty)$",
  "opacity 0.90,^(rofi)$",
}

-- Keybindings
bind = {
  -- App / session
  "SUPER, Q, killactive,",
  "SUPER, RETURN, exec, kitty",
  "SUPER, A, exec, rofi -show drun -theme ~/.config/rofi/aero.rasi",
  "SUPER, L, exec, swaylock -c 1e1e2e",
  "SUPER, M, exit,",
  "SUPER, W, exec, swww img ~/.config/hypr/wallpapers/default.png",

  -- Window management
  "SUPER, F, fullscreen, 0",
  "SUPER, SPACE, togglefloating,",
  "SUPER, P, pseudo,",
  "SUPER, V, togglesplit,",

  -- Focus navigation
  "SUPER, LEFT, movefocus, l",
  "SUPER, RIGHT, movefocus, r",
  "SUPER, UP, movefocus, u",
  "SUPER, DOWN, movefocus, d",

  "SUPER, H, movefocus, l",
  "SUPER, J, movefocus, d",
  "SUPER, K, movefocus, u",
  "SUPER, L, movefocus, r",

  -- Move windows
  "SUPER SHIFT, LEFT, movewindow, l",
  "SUPER SHIFT, RIGHT, movewindow, r",
  "SUPER SHIFT, UP, movewindow, u",
  "SUPER SHIFT, DOWN, movewindow, d",

  "SUPER SHIFT, H, movewindow, l",
  "SUPER SHIFT, J, movewindow, d",
  "SUPER SHIFT, K, movewindow, u",
  "SUPER SHIFT, L, movewindow, r",

  -- Workspaces
  "SUPER, 1, workspace, 1",
  "SUPER, 2, workspace, 2",
  "SUPER, 3, workspace, 3",
  "SUPER, 4, workspace, 4",
  "SUPER, 5, workspace, 5",
  "SUPER, 6, workspace, 6",
  "SUPER, 7, workspace, 7",
  "SUPER, 8, workspace, 8",
  "SUPER, 9, workspace, 9",

  "SUPER SHIFT, 1, movetoworkspace, 1",
  "SUPER SHIFT, 2, movetoworkspace, 2",
  "SUPER SHIFT, 3, movetoworkspace, 3",
  "SUPER SHIFT, 4, movetoworkspace, 4",
  "SUPER SHIFT, 5, movetoworkspace, 5",
  "SUPER SHIFT, 6, movetoworkspace, 6",
  "SUPER SHIFT, 7, movetoworkspace, 7",
  "SUPER SHIFT, 8, movetoworkspace, 8",
  "SUPER SHIFT, 9, movetoworkspace, 9",

  -- Mouse wheel workspace switching
  "SUPER, mouse_down, workspace, e+1",
  "SUPER, mouse_up, workspace, e-1",

  -- Media keys
  "", "XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%",
  "", "XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%",
  "", "XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle",
  "", "XF86MonBrightnessUp, exec, brightnessctl set +5%",
  "", "XF86MonBrightnessDown, exec, brightnessctl set 5%-",
}

bindm = {
  "SUPER, mouse:272, movewindow",
  "SUPER, mouse:273, resizewindow",
}

-- Optional: special scratchpad
bind = {
  "SUPER, GRAVE, togglespecialworkspace, magic",
}

-- Theme-specific overlay: keeps the Aero finish
layerrule = {
  "blur,waybar",
  "blur,rofi",
}
