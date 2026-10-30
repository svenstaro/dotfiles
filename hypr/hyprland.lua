require("binds")
require("input")
require("rules")

-- Written by nwg-displays
for _, generated in ipairs({ "monitors", "workspaces" }) do
    local ok, err = pcall(require, generated)
    if not ok then
        print("Optional config not loaded (" .. generated .. "): " .. tostring(err))
    end
end

-- gruvbox colors
local fg1 = "rgb(ebdbb2)"
local bg3 = "rgb(665c54)"
local bg = "rgb(282828)"
local red0 = "rgb(cc241d)"
local green0 = "rgb(98971a)"
local yellow0 = "rgb(d79921)"
local blue0 = "rgb(458588)"
local purple0 = "rgb(b16286)"
local aqua0 = "rgb(689d6a)"
local orange0 = "rgb(d65d0e)"

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 1,

        col = {
            active_border = { colors = { blue0, aqua0 }, angle = 45 },
            inactive_border = bg,
        },

        layout = "dwindle",

        resize_on_border = true,
        allow_tearing = true,
    },

    decoration = {
        rounding = 5,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = bg,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    -- https://wiki.hypr.land/configuring/layouts/dwindle-layout/
    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,
        vrr = {{ vrr }},
        disable_hyprland_logo = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    render = {
        -- Direct scanout reduces lag when a single fullscreen app is visible
        -- (e.g. a game). Set to false if fullscreen apps show graphical glitches.
        direct_scanout = true,

        -- Workaround for vertical screen with wpaperd, see
        -- https://github.com/danyspin97/wpaperd/issues/117
        expand_undersized_textures = false,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 },   { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 0.8, stiffness = 400, damping = 30 })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 6,    bezier = "default" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- Environment variables

-- Enable Electron apps to have native Wayland support
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Also check /etc/greetd/regreet.toml
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
{% if profile == "cypher" -%}
hl.env("RUSTICL_ENABLE", "radeonsi")
{% endif -%}
{% if profile == "neo" -%}
hl.env("LIBVA_DRIVER_NAME", "nvidia")

-- This is recommended by the Hyprland folks and I noticed it makes Discord stop
-- flickering by it also makes moonlight-qt not launch.
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Enable nvidia-vaapi-driver hardware acceleration
hl.env("NVD_BACKEND", "direct")
{% endif -%}

-- Autostart apps
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("wpaperd -d")
{% if profile == "cypher" -%}
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("nm-applet --indicator")
{% endif -%}
    hl.exec_cmd("hypridle")
end)
