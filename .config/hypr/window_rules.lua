hl.window_rule({
  match = {
    class = ".*",
  },
  opacity = 0.90,
  xray = false
})

hl.window_rule({
  match = { class = "^(org\\.gnome\\.)$" },
  rounding = 12,
})

hl.window_rule({
  match = { class = "^(pavucontrol)$" },
  float = true,
  size = "800 500",
})

hl.window_rule({
  match = { class = "^(nm-connection-editor)$" },
  tile = true,
})

hl.window_rule({
  match = { class = "^(org\\.gnome\\.Calculator)$" },
  float = true,
})

hl.window_rule({
  match = { class = "^(xdg-desktop-portal)$" },
  float = true,
  center = true,
})

hl.window_rule({
  match = { class = "^(firefox||app\\.zen_browser\\.zen)$", title = "^(Picture-in-Picture)$" },
  float = true,
})

hl.window_rule({
  match = {
    class = "^(app\\.zen_browser\\.zen||firefox||helium)$"
  },
  opacity = 1
})

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name           = "suppress-maximize-events",
  match          = { class = ".*" },

  suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

hl.window_rule({
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

hl.window_rule({
  match = {
    class = "^DesktopEditors$",
    title = ".*"
  },
  float = true,
  center = true
})

hl.window_rule({
  match = {
    class = "^hyprland-share-picker$",
    title = ".*"
  },
  float = true,
  center = true
})


hl.window_rule({
  match = {
    class = "^Minecraft.*$"
  },
  float = true,
  center = true,
  opacity = 1,
  size = "1920 1080"
})

-- Bitwarden
---@class FloatRule
---@field width    integer    width as percent of monitor width  (1..100)
---@field height   integer    height as percent of monitor height (1..100)
---@field patterns string[]   Lua patterns matched against window title

---@type FloatRule[]
local rules = {
  {
    width = 30,
    height = 54,
    patterns = {
      "%(Bitwarden.*Password Manager%) %- Bitwarden",
      "^Bitwarden$",
    }
  },
  {
    width = 25,
    height = 54,
    patterns = {
      "^Connexion : comptes Google %—",
      "^Sign In %- Google Accounts %— ",
      -- "^Sign in %- Googe Accounts %- Helium$",
    }
  },
}

---Return true if `title` matches any pattern in `rule`.
---@param title string
---@param rule  FloatRule
---@return boolean
local function matches(title, rule)
  for _, pattern in ipairs(rule.patterns) do
    if title:match(pattern) then return true end
  end
  return false
end

hl.on("window.title", function(window)
  local title = window.title or ""
  for _, rule in ipairs(rules) do
    if matches(title, rule) then
      local monitor = hl.get_active_monitor()
      if not monitor then return end

      hl.dispatch(hl.dsp.window.float({ window = window, action = "on" }))
      hl.dispatch(hl.dsp.window.center({ window = window, action = "on" }))
      hl.dispatch(hl.dsp.window.resize({
        window = window,
        x = math.floor(monitor.width * rule.width / 100),
        y = math.floor(monitor.height * rule.height / 100),
      }))
      return
    end
  end
end)
