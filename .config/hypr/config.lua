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
})

-- ==================
-- DECORATION
-- ==================
hl.config({
  decoration = {
    rounding = 12,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 30,
      render_power = 5,
      offset = { 0, 5 },
      color = "rgba(00000070)",
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
    follow_min_visible = 1
  },
})

----------------
----  MISC  ----
----------------

hl.config({
  misc = {
    force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
  },
})

-- ==================
-- MISC
-- ==================
hl.config({
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
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
