-- Monitor configuration
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- NVIDIA / GPU environment
-- LIBVA_DRIVER_NAME and __GLX_VENDOR_LIBRARY_NAME are needed for hardware
-- video decode and GLX on NVIDIA. Hybrid-graphics vars (DRI_PRIME,
-- __VK_LAYER_NV_optimus) and WLR_NO_HARDWARE_CURSORS were removed: the first
-- two don't apply to a single-GPU system, and the last is a wlroots var
-- Hyprland no longer reads -- use cursor:no_hardware_cursors if ever needed.
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
