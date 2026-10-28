local home_dir = os.getenv("HOME")
local xdg_data_dirs_old = os.getenv("XDG_DATA_DIRS") or ""

-- Session / XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland", true)
hl.env("XDG_SESSION_TYPE", "wayland", true)
hl.env("XDG_SESSION_DESKTOP", "Hyprland", true)

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic", true)
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

-- Toolkit backends: prefer Wayland, fall back to X11
hl.env("GDK_BACKEND", "wayland,x11,*", true)
hl.env("QT_QPA_PLATFORM", "wayland;xcb", true)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto", true)

-- Qt theming via qt6ct
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct", true)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1", true)
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1", true)

-- NVIDIA (desktop / NVIDIA-only systems)
-- On a hybrid laptop (Intel/AMD iGPU + NVIDIA), DELETE this block:
-- these force everything onto the dGPU. Use prime-run per app instead.
hl.env("LIBVA_DRIVER_NAME", "nvidia", true) -- hardware video decode
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia", true)
hl.env("NVD_BACKEND", "direct", true)       -- for nvidia-vaapi-driver
-- Only if you hit problems; can break some apps (e.g. Firefox):
-- hl.env("GBM_BACKEND", "nvidia-drm", true)

hl.env("XDG_DATA_DIRS",
  home_dir ..
  "/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:" ..
  xdg_data_dirs_old)


hl.env("HYPRGLASS_SKIP_VERSION_CHECK", "1")
