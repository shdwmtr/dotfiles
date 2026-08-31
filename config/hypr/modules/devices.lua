local M = {}
M.main_monitor_scale = "1.5"

hl.monitor({
    output   = "DP-2",
    mode     = "preferred",
    position = "auto",
    scale    = M.main_monitor_scale,
})

hl.monitor({
    output    = "HDMI-A-1",
    mode     = "1920x1080@200.00000",
    position = "auto-left",
    transform = 1,
    scale    = "1",

})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

for i = 1, 10 do
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = "DP-2",
        default    = true,
        persistent = i <= 6,
    })
end

hl.workspace_rule({
    workspace  = "11",
    monitor    = "HDMI-A-1",
    default    = true,
    persistent = true,
    layout     = "lua:pancake"
})

return M
