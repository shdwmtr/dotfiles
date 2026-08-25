-- monitor setup
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1.2",
})
-- headless monitor is configured dynamically by headless.sh at runtime,
-- since Hyprland's auto-assigned name for it isn't stable across sessions
-- mouse setup
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
