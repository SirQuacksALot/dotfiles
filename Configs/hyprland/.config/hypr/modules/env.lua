-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force hardware acceleration for offloaded rendering
hl.env("LIBVA_DRIVER_NAME", "INTEL")

-- Firefox wayland optimizations
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATTFROM", "wayland;xcb")

-- Default editor
hl.env("EDITOR", "nvim")
