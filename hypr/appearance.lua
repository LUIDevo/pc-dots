-- General, decorations, layouts, misc
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 15,
        border_size = 1,
        col = {
            active_border   = "rgba(595959aa)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,
        active_opacity   = 0.94,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 6,
            render_power = 3,
            color        = 0xee1a1a1a,  -- rgba(1a1a1aee)
        },

        blur = {
            enabled  = true,
            size     = 4,
            passes   = 1,
            vibrancy = 0.9,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
})
