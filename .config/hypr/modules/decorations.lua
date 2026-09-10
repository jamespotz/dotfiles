hl.config({
  decoration = {
    rounding = 20,
    rounding_power = 2,
    active_opacity = 0.95,
    inactive_opacity = 0.89,

    shadow = {
      enabled = true,
      range = 28,
      render_power = 3,
      color = "0x890a0a0a",
    },

    blur = {
      enabled           = true,
      brightness        = 0.8,
      contrast          = 2,
      passes            = 2,
      vibrancy          = 0.35,
      vibrancy_darkness = 0.35,
      noise             = 0,
      size              = 10,
      special           = false,
      ignore_opacity    = true,
      new_optimizations = true,
    },
  },
})
