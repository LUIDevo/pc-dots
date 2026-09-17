local progs   = require("programs")
local mainMod = "SUPER"

-- Floating-window rules live in windows.lua (kept with the other window rules).

----------------------------------------------------------------------
-- App launchers / scripts
----------------------------------------------------------------------
hl.bind(mainMod .. " + a",            hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + Return",       hl.dsp.exec_cmd(progs.terminal))
hl.bind(mainMod .. " + ALT + P",      hl.dsp.exec_cmd("~/scripts/selector.sh"))
hl.bind(mainMod .. " + SHIFT + R",    hl.dsp.exec_cmd("~/scripts/restartWaybar.sh"))
hl.bind(mainMod .. " + SHIFT + P",    hl.dsp.exec_cmd("~/.config/rofi/powermenu.sh"))
hl.bind(mainMod .. " + CTRL + P",     hl.dsp.exec_cmd("~/.config/rofi/pomodoro-rofi.sh"))
hl.bind(mainMod .. " + CTRL + S",     hl.dsp.exec_cmd("~/scripts/spotify-wake.sh"))
hl.bind(mainMod .. " + SHIFT + T",    hl.dsp.exec_cmd("~/scripts/timer.sh"))
hl.bind(mainMod .. " + CTRL + L",     hl.dsp.exec_cmd("~/scripts/hyprlock.sh"))
hl.bind(mainMod .. " + SHIFT + A",    hl.dsp.exec_cmd("python ~/.config/rofi/archive/aw-categorise.py"))
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd("bash ~/.config/yazi/launch.sh"))
hl.bind(mainMod .. " + D",            hl.dsp.exec_cmd(progs.menu))
hl.bind(mainMod .. " + SHIFT + Z",    hl.dsp.exec_cmd("~/scripts/zen.sh"))
hl.bind(mainMod .. " + SHIFT + W",    hl.dsp.exec_cmd("~/.config/waybar/changeColors"))
hl.bind(mainMod .. " + Z",            hl.dsp.exec_cmd("~/.config/rofi/zeit_menu.sh"))
hl.bind(mainMod .. " + y",            hl.dsp.exec_cmd(progs.fileManager))
hl.bind(mainMod .. " + page_up",      hl.dsp.exec_cmd("hyprpicker"))
hl.bind(mainMod .. " + b",            hl.dsp.exec_cmd("blueman-manager"))
hl.bind(mainMod .. " + F12",          hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + t",            hl.dsp.exec_cmd("~/scripts/tw.sh"))
hl.bind(mainMod .. " + P",            hl.dsp.exec_cmd("~/scripts/tofi.sh"))

----------------------------------------------------------------------
-- Window management
----------------------------------------------------------------------
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen())
-- TODO(verify): no confirmed hl.dsp for `focuscurrentorlast` yet; using raw
-- dispatch as a guaranteed-working fallback. Swap to native when documented.
hl.bind(mainMod .. " + TAB",       hl.dsp.exec_cmd("hyprctl dispatch focuscurrentorlast"))

----------------------------------------------------------------------
-- Move focus (FIXED: original arrow binds used invalid dirs h/l/k/d)
----------------------------------------------------------------------
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

----------------------------------------------------------------------
-- Workspaces (1..10, with 0 -> 10)
----------------------------------------------------------------------
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.window.move({ workspace = "e+0" }))

----------------------------------------------------------------------
-- Mouse drag / resize
----------------------------------------------------------------------
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

----------------------------------------------------------------------
-- Multimedia keys
----------------------------------------------------------------------
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),   { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),{ locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                        { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
