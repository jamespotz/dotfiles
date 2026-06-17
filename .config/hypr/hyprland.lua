hl.monitor({
  output = "DP-1",
  disabled = false,
  mode = "3440x1440@144.00Hz",
  position = "0x0",
  scale = 1.25,
  bitdepth = 10,
  cm = "hdredid",
  sdrbrightness = 0.5,
  sdr_min_luminance = 0.1,
  sdr_max_luminance = 427,
  min_luminance = 0.1,
  max_luminance = 427,
  max_avg_luminance = 409,
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

require("env")
require("autostart")
require("config")
require("binds")
require("window_rules")
require("layer_rules")
require("noctalia")
require("animations")
