-- https://wiki.hypr.land/Configuring/Basics/Binds
local terminal          = "kitty"
local fileManager       = "cargo run --manifest-path ~/Development/zex/Cargo.toml"
local menu              = "pkill wofi || wofi --show drun"
local color_picker      = "wl-copy $(hyprpicker)"
local mainMod           = "SUPER"

local shutdown_cmd      = "hyprshutdown"
local raise_volume      = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
local lower_volume      = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
local toggle_audio_mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
local toggle_mic_mute   = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

local brightness_up     = "brightnessctl -e4 -n2 set 5%+"
local brightness_down   = "brightnessctl -e4 -n2 set 5%-"

local audio_next        = "playerctl next"
local audio_pause_play  = "playerctl play-pause"
local audio_prev        = "playerctl previous"

local monospace_font    = "$(fc-match --format='%{family}' monospace)"
local screenshot_cmd    = "still -c 'grim -g \"$(slurp -d -b \"#0C0C0C75\" -c \"#fff\" -F " .. monospace_font .. ")\" - | wl-copy'"

function kb(...)
	return table.concat({ ... }, " + ")
end

hl.bind(kb(mainMod, "RETURN"), hl.dsp.exec_cmd(terminal))
hl.bind(kb(mainMod, "SHIFT", "Q"), hl.dsp.window.close())
hl.bind(kb(mainMod, "SHIFT", "P"), hl.dsp.window.close())
hl.bind(kb(mainMod, "SHIFT", "E"), hl.dsp.exec_cmd(shutdown_cmd))
hl.bind(kb(mainMod, "E"), hl.dsp.exec_cmd(fileManager))
hl.bind(kb(mainMod, "V"), hl.dsp.window.float({ action = "toggle" }))
hl.bind(kb(mainMod, "D"), hl.dsp.exec_cmd(menu))
hl.bind(kb(mainMod, "C"), hl.dsp.exec_cmd(color_picker))
hl.bind(kb(mainMod, "P"), hl.dsp.window.pseudo())
hl.bind(kb(mainMod, "J"), hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(kb(mainMod, "left"), hl.dsp.focus({ direction = "left" }))
hl.bind(kb(mainMod, "right"), hl.dsp.focus({ direction = "right" }))
hl.bind(kb(mainMod, "up"), hl.dsp.focus({ direction = "up" }))
hl.bind(kb(mainMod, "down"), hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(kb(mainMod, key), hl.dsp.focus({ workspace = i }))
	hl.bind(kb(mainMod, "SHIFT", key), hl.dsp.window.move({ workspace = i }))
end

hl.bind(kb(mainMod, "S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(kb(mainMod, "SHIFT", "Z"), hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(kb(mainMod, "SHIFT", "S"), hl.dsp.exec_cmd(screenshot_cmd))

hl.bind(kb(mainMod, "mouse_down"), hl.dsp.focus({ workspace = "e+1" }))
hl.bind(kb(mainMod, "mouse_up"), hl.dsp.focus({ workspace = "e-1" }))
hl.bind(kb(mainMod, "mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(kb(mainMod, "mouse:273"), hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(raise_volume), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(lower_volume), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(toggle_audio_mute), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(toggle_mic_mute), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(brightness_up), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightness_down), { locked = true, repeating = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(audio_pause_play), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(audio_pause_play), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(audio_next), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(audio_prev), { locked = true })

hl.bind(kb(mainMod, "SHIFT", "EQUAL"), hl.dsp.exec_cmd(audio_next), { locked = true })
hl.bind(kb(mainMod, "SHIFT", "MINUS"), hl.dsp.exec_cmd(audio_prev), { locked = true })

-- script to mute discord. hotkey must be setup with discord running in xwayland, then command
hl.bind("CONTROL + code:62", function() hl.exec_cmd("xdotool key ctrl+F13") end, { desc = "Discord Mute" })
