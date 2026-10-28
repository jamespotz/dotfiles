hl.config({
  decoration = {
    rounding = 16,
    rounding_power = 2,
    active_opacity = 0.95,
    inactive_opacity = 0.85,

    shadow = {
      enabled = true,
      range = 28,
      render_power = 3,
      color = "0x890a0a0a",
    },

    blur = {
      enabled = true,

      brightness = 0.8,
      contrast = 2,
      noise = 0,
      vibrancy = 0.35,
      vibrancy_darkness = 0.35,

      passes = 2,
      size = 10,

      special = false,

      -- kawase | frost | ripple | drops | water | fluid_jar | prism | heat_shimmer | acrylic | aurora | haze
      -- Only the selected variant's block below is used; the rest are Hyprland defaults unless tuned.
      variant = "heat_shimmer",

      acrylic = {
        refraction = 40,
        bulb = 24,
        clarity = 0.6,
        aberration = 0.12,
        tint = '0x14FFFFFF',
      },
      glass = {
        refraction = 20,
        size = 40,
        roughness = 1.0,
      },
      ripple = {
        strength = 32,
        radius = 400,
        width = 64,
        duration = 0.9,
      },
      drops = {
        speed = 3, },
      water = {
        strength = 32,
        radius = 20,
        speed = 0.76,
        damping = 0.95,
        duration = 12,
      },
      fluid_jar = {
        color = '0xCC3399FF',
        speed = 3.7,
        fill_amount = 0.5,
        mass = 1.4,
        precision = 2,
        turbulence = 1.2,
        distortion = 8,
      },
      heat_shimmer = {
        speed = 1,
      },
      aurora = {
        speed = 1,
        intensity = 0.35,
        color1 = '0x29F0A0FF',
        color2 = '0x7A4DFFFF',
      },
      haze = {
        intensity = 0.35,
        iridescence = 0.7,
      },
    },

    glow = {
      enabled = true,
      range = 14,
      render_power = 3,
    },

    wobble = {
      enabled = true,
      intensity = 0.4,
      stiffness = 200,
      damping = 12,
    },
  }
})
