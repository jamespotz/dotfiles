hl.config({
  animations = {
    enabled = true,
  },
})

-- Curves
-- Smooth, fast, and not too bouncy.
hl.curve("easeOutQuart", {
  type = "bezier",
  points = {
    { 0.25, 1.0 },
    { 0.5,  1.0 },
  },
})

hl.curve("easeOutCubic", {
  type = "bezier",
  points = {
    { 0.33, 1.0 },
    { 0.68, 1.0 },
  },
})

hl.curve("easeInOutCubic", {
  type = "bezier",
  points = {
    { 0.65, 0.0 },
    { 0.35, 1.0 },
  },
})

hl.curve("almostLinear", {
  type = "bezier",
  points = {
    { 0.5,  0.5 },
    { 0.75, 1.0 },
  },
})

-- Optional subtle spring for window movement/opening
hl.curve("softSpring", {
  type = "spring",
  mass = 1,
  stiffness = 80,
  dampening = 18,
})

-- Global fallback
hl.animation({
  leaf = "global",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuart",
})

-- Windows
-- Good for normal app open/move behavior.
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 3.5,
  spring = "softSpring",
  style = "slide",
})

-- Window open
hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 3.2,
  bezier = "easeOutQuart",
  style = "slide",
})

-- Window close
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 2.2,
  bezier = "easeOutCubic",
  style = "popin 92%",
})

-- Window move/resize
hl.animation({
  leaf = "windowsMove",
  enabled = true,
  speed = 3,
  spring = "softSpring",
})

-- Fade
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 2.5,
  bezier = "easeOutCubic",
})

hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 2,
  bezier = "easeOutCubic",
})

hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 1.8,
  bezier = "almostLinear",
})

-- Popups / menus
-- Useful for launchers, context menus, Bitwarden popups, etc.
hl.animation({
  leaf = "fadePopups",
  enabled = true,
  speed = 2,
  bezier = "easeOutCubic",
})

hl.animation({
  leaf = "fadePopupsIn",
  enabled = true,
  speed = 1.8,
  bezier = "easeOutQuart",
})

hl.animation({
  leaf = "fadePopupsOut",
  enabled = true,
  speed = 1.5,
  bezier = "almostLinear",
})

-- Layers
-- Waybar, notifications, logout menus, launchers, shell overlays.
hl.animation({
  leaf = "layers",
  enabled = true,
  speed = 3,
  bezier = "easeOutQuart",
  style = "fade",
})

hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 2.5,
  bezier = "easeOutQuart",
  style = "fade",
})

hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 2,
  bezier = "easeOutCubic",
  style = "fade",
})

-- Borders
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 5,
  bezier = "easeOutQuart",
})

-- Workspaces
-- Horizontal slide is usually best for productivity.
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 4,
  bezier = "easeInOutCubic",
  style = "slide",
})

hl.animation({
  leaf = "workspacesIn",
  enabled = true,
  speed = 4,
  bezier = "easeInOutCubic",
  style = "slide",
})

hl.animation({
  leaf = "workspacesOut",
  enabled = true,
  speed = 4,
  bezier = "easeInOutCubic",
  style = "slide",
})
