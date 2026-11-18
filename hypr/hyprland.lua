-- Variables + ENV

local LAPTOP_TP_ENABLED = true

hl.env("GTK_THEME", "Sweet:dark")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

local colors = require("conf.colors")

hl.monitor({
  output = "",  -- All
  mode = "preferred",
  position = "auto",
  scale = 1,
})

-- Hyprland Config

hl.config({
    general = {
        border_size = 4,
        col = {
            active_border = colors.source_color,
            inactive_border = colors.secondary_fixed_dim
        },
        gaps_in = 10,
        gaps_out = 14,
        layout = "dwindle",
        resize_on_border = true,
    },
    decoration = {
        blur = {
            enabled = true,
            new_optimizations = true,
            passes = 1,
            size = 3,
        },
        rounding = 10,
        shadow = {
            color = "rgba(1a1a1aee)",
            enabled = true,
            range = 30,
            render_power = 3,
        },
    },
    input = {
        follow_mouse = 1,
        kb_layout = "us",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        kb_variant = "",
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    misc = {
        disable_hyprland_logo = true,
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },
    xwayland = {
        force_zero_scaling = true,
    },
    group = {
        groupbar = {
            col = {
                active = colors.on_tertiary_container,
            },
            font_size = 12,
            indicator_height = 5,
        },
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
    },
    master = {
        new_status = "master",
    },
    animations = {
        enabled = true,
    },
    debug = {
        disable_logs = false,
    }
})

require("conf.animations")
require("conf.devices")
require("conf.rules")
require("conf.binds")

-- Startup config

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")
    hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("uwsm app -- walker --gapplication-service")
    hl.exec_cmd("uwsm app -- /opt/forticlient/fortitray")
end)

-- Added by hyprmoncfg: its generated monitor rules load last, so nothing before this can override the applied layout.
do local path = os.getenv("HOME") .. "/.config/hypr/hyprmoncfg-monitors.lua"; local file = io.open(path, "r"); if file then file:close(); dofile(path) end end
