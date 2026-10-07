hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("stripGlide", {
  type = "spring",
  mass = 1.0,
  stiffness = 150.0,
  dampening = 25.0,
})

hl.curve("columnSettle", {
  type = "spring",
  mass = 1.0,
  stiffness = 190.0,
  dampening = 22.0,
})

hl.curve("subtleEase", {
  type = "spring",
  mass = 1.0,
  stiffness = 200.0,
  dampening = 29.0,
})

hl.curve("softDrift", {
  type = "spring",
  mass = 1.0,
  stiffness = 110.0,
  dampening = 21.0,
})

hl.curve("quickSnap", {
  type = "spring",
  mass = 1.0,
  stiffness = 280.0,
  dampening = 34.0,
})

hl.animation({
  leaf = "windowsMove",
  enabled = true,
  speed = 5,
  spring = "stripGlide",
})

hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 4,
  spring = "subtleEase",
  style = "popin 96%",
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 3,
  spring = "subtleEase",
  style = "popin 97%",
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 5,
  spring = "subtleEase",
  style = "slidefadevert 8%",
})

hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = 5,
  spring = "subtleEase",
  style = "slidefadevert 10%",
})

hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 4,
  spring = "columnSettle",
  style = "popin 80%",
})

hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 3,
  spring = "softDrift",
  style = "fade",
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 4,
  spring = "quickSnap",
})

hl.animation({
  leaf = "border",
  enabled = true,
  speed = 3,
  spring = "quickSnap",
})
