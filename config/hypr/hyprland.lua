local devices = require("modules.devices")
require("modules.animations")
require("modules.keybinds")
require("modules.config")
require("modules.window_rules")

local env = require("modules.environment")
local autorun = require("modules.autorun")

env.set("HYPRCURSOR_SIZE", "24")
env.set("XCURSOR_SIZE", "24")
env.set("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
env.set("GTK_THEME", "Adwaita:dark")

env.set("WALLPIPER_PORTAL", "hyprland")
env.set("WALLPIPER_WE_UI_SCALE_FACTOR", devices.main_monitor_scale)

env.write()

local startup_apps = {
    { cmd = "brave",                          workspace = "1 silent" },
    { cmd = "discord",                        workspace = "11 silent" },
    { cmd = "flatpak run com.spotify.Client", workspace = "11 silent" },
}

local daemon_cmnds = {
    -- fix cursor scaling for xwayland applications
    "hyprctl setcursor Adwaita 24",

    -- run sunshine
    "sunshine",

    -- run Wallpaper Engine
    "wallpiperd > /tmp/wallpiper-host.log",

    -- apply dpi to x11 for xwayland scaling
    string.format([[xrdb -merge <<< "Xft.dpi: %.1f"]], devices.main_monitor_dpi)
}

-- force all windows on my HDMI-monitor into be pancakes,
hl.layout.register("pancake", {
    recalculate = function(ctx)
        local n = #ctx.targets
        if n == 0 then return end

        for i, target in ipairs(ctx.targets) do
            target:place(ctx:row(i, n))
        end
    end,
})

autorun.on_hyprland_start(function()
    for i, app in ipairs(daemon_cmnds) do hl.exec_cmd(app) end
    for _, app in ipairs(startup_apps) do hl.exec_cmd(app.cmd, { workspace = app.workspace }) end
end)
