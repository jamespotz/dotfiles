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
  },
})

-- ==================
-- GENERAL LAYOUT
-- ==================
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,
    layout = "scrolling",
  },

  decoration = {
    rounding = 20,
    rounding_power = 2,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 2,
      vibrancy = 0.1696,
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
    allow_session_lock_restore = true
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
  cursor = {
    no_hardware_cursors = true
  },
})
