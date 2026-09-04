-- ==================
-- INPUT CONFIG
-- ==================
hl.config({
  input = {
    kb_layout = "us",
    numlock_by_default = true,
    sensitivity = 0,
    accel_profile = "flat",
    force_no_accel = true,
    follow_mouse = 2
  },
})

-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = {
      top = 0,
      bottom = 16,
      left = 16,
      right = 16
    },
    border_size = 2,
    layout = "scrolling",

    -- Set to true to enable click-and-drag border resizing
    resize_on_border = true,

    -- Extends the grab area (in pixels) outside the border
    extend_border_grab_area = 15,

    -- Changes your mouse cursor icon when hovering over the grab area
    hover_icon_on_border = true,
  },
})

hl.config({
  decoration = {
    rounding = 20,
    rounding_power = 2,
    active_opacity = 0.89,
    inactive_opacity = 0.89,

    shadow = {
      enabled = true,
      range = 28,
      render_power = 3,
      color = 0x890a0a0a,
    },

    blur = {
      enabled = true,
      brightness = 0.8,
      contrast = 2,
      passes = 2,
      vibrancy = 0.35,
      vibrancy_darkness = 0.35,
      noise = 0,
      size = 10,
      special = false
    },
  },

})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
  dwindle = {
    preserve_split = true, -- You probably want this
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
  master = {
    new_status = "master",
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
    follow_min_visible = 1,
  },
})

-- ==================
-- MISC
-- ==================
hl.config({
  misc = {
    disable_hyprland_logo      = true,
    force_default_wallpaper    = 0,
    disable_splash_rendering   = true,
    initial_workspace_tracking = 1,
    on_focus_under_fullscreen  = 1,
    allow_session_lock_restore = true,
    focus_on_activate          = true
  },
})

-- ==================
-- BINDS
-- ==================
hl.config({
  binds = {
    workspace_back_and_forth = true,
    workspace_center_on = 1,
  },
})

-- unscale XWayland
hl.config({
  xwayland = {
    force_zero_scaling = true
  },
})
