local M = {}

function M.on_hyprland_start(callback)
    hl.on("hyprland.start", callback)
end

return M
