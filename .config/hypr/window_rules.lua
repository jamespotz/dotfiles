local rule = hl.window_rule

rule({
  match = {
    class = ".*",
  },
  opacity = 0.80,
  xray = false
})

rule({
  match = { class = "^(org\\.gnome\\.)$" },
  rounding = 12,
})

rule({
  match = { class = "^(pavucontrol)$" },
  float = true,
  size = "800 500",
})

rule({
  match = { class = "^(nm-connection-editor)$" },
  tile = true,
})

rule({
  match = { class = "^(org\\.gnome\\.Calculator)$" },
  float = true,
})

rule({
  match = { class = "^(xdg-desktop-portal)$" },
  float = true,
  center = true,
})

rule({
  match = {
    class = "^(app\\.zen_browser\\.zen||firefox||helium)$"
  },
  opacity = 1
})

local suppressMaximizeRule = rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

rule({
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

rule({
  match = {
    class = "^(DesktopEditors)$",
    title = ".*"
  },
  float = true,
  center = true
})

rule({
  match = {
    class = "^(hyprland-share-picker)$",
    title = ".*"
  },
  float = true,
  center = true
})

local float_titles = {
  "Open File", "Picture-in-Picture",
  "_crx_nngceckbapebfimnlniiiahkandclblb",
  "gopeed"
}

for _, t in ipairs(float_titles) do
  rule({ match = { title = "^(" .. t .. ")$" }, float = true })
end

---@class WindowSpec
---@field by      "class"|"title"
---@field name    string                  identifier (becomes regex ^(name)$)
---@field float?  boolean
---@field center? boolean
---@field size?   string                  "W H"
---@field extras? table[]                 list of additional rule({...}) bodies (arbitrary keys)

---@type WindowSpec[]
local app_specs = {
  { by = "title", name = "Bitwarden", float = true, center = true, size = "920 780" },
  {
    by = "title",
    name = "Minecraft.*",
    float = true,
    center = true,
    size = "1920 1080",
    extras = { { dim_around = true }, { immediate = true } },
  },
}

for _, s in ipairs(app_specs) do
  local match = { [s.by] = "^(" .. s.name .. ")$" }
  -- Each property of the spec becomes its own one-property rule (Hyprland
  -- prefers single-property rules; multi-property rules don't always merge).
  if s.float then rule({ match = match, float = true }) end
  if s.center then rule({ match = match, center = true }) end
  if s.size then rule({ match = match, size = s.size }) end
  for _, extra in ipairs(s.extras or {}) do
    extra.match = match
    rule(extra)
  end
end
