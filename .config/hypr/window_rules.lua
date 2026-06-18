hl.window_rule({
  match = {
    class = ".*",
  },
  opacity = 0.9,
  xray = false
})

hl.window_rule({
  match = { class = "^(org\\.gnome\\.)$" },
  rounding = 12,
})

hl.window_rule({
  match = { class = "^(pavucontrol)$" },
  float = true,
  size = "800 500",
})

hl.window_rule({
  match = { class = "^(nm-connection-editor)$" },
  tile = true,
})

hl.window_rule({
  match = { class = "^(org\\.gnome\\.Calculator)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(xdg-desktop-portal)$" },
  float = true,
  center = true,
})

hl.window_rule({
  match = { class = "^(firefox|app\\.zen_browser\\.zen)$", title = "^(Picture-in-Picture)$" },
  float = true,
})

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

hl.window_rule({
  match = { title = ".*Bitwarden.*" },
  float = true,
  center = true,
  size = { "600", "700" },
})

hl.window_rule({
  match = {
    class = "^DesktopEditors$",
    title = ".*"
  },
  float = true,
  center = true
})
