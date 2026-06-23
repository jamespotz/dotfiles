local utils = dofile(os.getenv("HOME") .. "/.config/hypr/utils.lua")

hl.monitor({
  output = "DP-1",
  disabled = false,
  mode = "3440x1440@144.00Hz",
  position = "0x0",
  scale = 1.25,
})

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

utils.safe_load("env")
utils.safe_load("autostart")
utils.safe_load("config")
utils.safe_load("binds")
utils.safe_load("window_rules")
utils.safe_load("layer_rules")
utils.safe_load("animations")
utils.safe_load("plugins/init")

-- For Noctalia Color templates
require("noctalia").apply_theme()
