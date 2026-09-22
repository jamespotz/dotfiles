hl.config({
  animations = {
    enabled = true,
  },
})

hl.curve("panEase", { type = "bezier", points = { { 0.25, 1 }, { 0.4, 1 } } })

hl.curve("snappyTape", {
  type = "spring",
  mass = 1.0,
  stiffness = 95.0,
  dampening = 14.0
})

hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 6,
  spring = "snappyTape",
  style = "slide left"
})

hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 5,
  bezier = "panEase",
  style = "slide right"
})

hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 5,
  bezier = "panEase",
  style = "slidefade 15%"
})

hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 4,
  bezier = "panEase",
  style = "popin 70%"
})

hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 3,
  bezier = "panEase",
  style = "fade"
})

hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 4,
  bezier = "panEase"
})

hl.animation({
  leaf = "border",
  enabled = true,
  speed = 3,
  spring = "snappyTape"
})
