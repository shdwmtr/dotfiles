require("modules.devices")
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
env.write()

local startup_apps = {
    { cmd = "brave",                          workspace = "1 silent" },
    { cmd = "discord",                        workspace = "special:magic silent" },
    { cmd = "flatpak run com.spotify.Client", workspace = "special:magic silent" },
    { cmd = "zeditor",                        workspace = "2 silent" }
}

local daemon_cmnds = {
    -- fix cursor scaling for xwayland applications
    "hyprctl setcursor Adwaita 24",
    -- set scaling and other resources for xwayland apps.
    "xrdb -merge ~/.Xresources",

    "hyprpaper",
    "sunshine",

    -- hard to give waybar a proper output, so just restart it if it dies
    -- (it dies if the display disappears or doesn't exist)
    "while true; do waybar; sleep 0.5; done"
}

autorun.on_hyprland_start(function()
    for i, app in ipairs(daemon_cmnds) do hl.exec_cmd(app) end
    for _, app in ipairs(startup_apps) do hl.exec_cmd(app.cmd, { workspace = app.workspace }) end
end)
