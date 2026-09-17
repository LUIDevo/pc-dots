-- Autostart apps / daemons
hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("aw-qt")
    hl.exec_cmd("waybar --config ~/.config/waybar/config --style ~/.config/waybar/tokyo-night.css")
    hl.exec_cmd("xremap " .. os.getenv("HOME") .. "/config.yml")
end)
