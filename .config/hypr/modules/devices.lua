-- monitor setup
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1.25",
})
-- headless monitor setup
hl.monitor({
    output = "HEADLESS-2",
    mode = "2560x1664@60",
    position = "auto",
    scale = "1.33",
})
-- mouse setup
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
