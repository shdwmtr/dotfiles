-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 10,
        border_size      = 2,
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
        col              = {
            active_border   = "rgba(777777ff)",
            inactive_border = "rgba(595959aa)",
        },
    },
    decoration = {
        rounding         = 0,
        rounding_power   = 4,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },
        blur             = {
            enabled           = true,
            size              = 4,
            passes            = 4,
            new_optimizations = true,
            vibrancy          = 0.1696,
        },
    },
    animations = {
        enabled = false,
    },
    dwindle = {
        preserve_split = true, -- You probably want this
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper  = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = true,
        focus_on_activate        = true,
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",
        follow_mouse = 1,
        sensitivity  = -0.5, -- -1.0 - 1.0, 0 means no modification.
        touchpad     = {
            natural_scroll = false,
        },
    },
    xwayland = {
        force_zero_scaling = true,
    }
})
