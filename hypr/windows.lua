-- Window rules

-- Ignore maximize requests from all apps
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland dragging issues
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Zen: force fully opaque (override global opacity)
hl.window_rule({
    name    = "zen-opacity",
    match   = { class = "^zen$" },
    opacity = "1.0 override 1.0 override",
})

-- Floating apps
hl.window_rule({ name = "float-floating", match = { class = "^floating$" },          float = true })
hl.window_rule({ name = "float-nautilus", match = { class = "^org\\.gnome\\.Nautilus$" }, float = true })
hl.window_rule({ name = "float-yazi",     match = { class = "^yazi$" },              float = true })
hl.window_rule({ name = "float-blueman",  match = { class = "(?i).*blueman-manager.*" }, float = true })
hl.window_rule({ name = "float-pavu",     match = { class = "(?i).*pavucontrol.*" }, float = true })
