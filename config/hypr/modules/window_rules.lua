hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- allow moving the windows with the mouse
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- windows rendered with blur effect
hl.layer_rule({ name = "wofi-blur", match = { namespace = "wofi" }, blur = true, })
hl.layer_rule({ name = "waybar-blur", match = { namespace = "waybar" }, blur = true, })

-- hint to hyprland the target workspace to start apps
hl.window_rule({ match = { class = "brave-browser" }, workspace = "1 silent", })
-- hl.window_rule({ match = { class = "dev.zed.Zed" }, workspace = "2 silent", })
hl.window_rule({ match = { class = "spotify" }, workspace = "11 silent" })
hl.window_rule({ match = { class = "discord" }, workspace = "11 silent", })
hl.window_rule({ match = { class = "steam" }, workspace = "6 silent", })

-- globally suppress maximize events, they should always be ignored
hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- I personally don't like fullscreen windows, I want to keep them all windowed.
-- this tells the external window it went fullscreen (2), but tells hyprland nothing happened (1)
-- hl.on("window.fullscreen", function(w)
--     hl.dispatch(hl.dsp.window.fullscreen_state({
--         internal = 0, client = 2, action = "set", window = w,
--     }))
-- end)
