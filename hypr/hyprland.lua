-- Main Hyprland config (Lua) — imports modules.
-- Lua config supported since Hyprland 0.55. While this file exists, the old
-- *.conf files are IGNORED. Delete/rename hyprland.lua to fall back to them.
-- require() uses paths relative to this file, no .lua extension.

require("monitors")
require("environment")
require("appearance")
require("animations")
require("input")
require("keybinds")   -- requires("programs") internally
require("windows")
require("autostart")
