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



  master = {
    new_status = "master",
  },


  dwindle = {
    preserve_split = true,
    smart_split    = false,
    smart_resizing = true,
  },

  scrolling = {
    fullscreen_on_one_column = true,
    focus_fit_method         = 1,
    column_width             = 0.5,
    follow_focus             = true,
    follow_min_visible       = 1,
    explicit_column_widths   = "0.35, 0.5, 0.65, 1.0"
  },

  xwayland = {
    force_zero_scaling = true
  }
})
