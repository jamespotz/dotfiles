hl.bind("SUPER + ALT + r", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("SUPER + ALT + l", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))

-- ============================================
-- Window Movement (SUPER + Shift + Arrows)
-- ============================================
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + Left", hl.dsp.layout("swapcol l"))
hl.bind("SUPER + SHIFT + Right", hl.dsp.layout("swapcol r"))

-- ============================================
-- Window States & Actions
-- ============================================

-- Window Resizing
hl.bind("SUPER + equal", hl.dsp.window.resize({ x = 10, y = 0 }))
hl.bind("SUPER + minus", hl.dsp.window.resize({ x = -10, y = 0 }))
hl.bind("SUPER + CTRL + equal", hl.dsp.window.resize({ x = 0, y = 10 }))
hl.bind("SUPER + CTRL + minus", hl.dsp.window.resize({ x = 0, y = -10 }))

hl.bind("SUPER + W", hl.dsp.window.float({ action = "toggle" }))

-- Toggle Tab
hl.bind("SUPER + Tab", hl.dsp.window.cycle_next())

-- Fullscreen and maximize
hl.bind("ALT + f", hl.dsp.window.fullscreen())
hl.bind("ALT + SHIFT + f", hl.dsp.window.fullscreen())
hl.bind("ALT + a", hl.dsp.window.fullscreen())

-- Scratchpad
hl.bind("ALT + z", hl.dsp.workspace.toggle_special("scratchpad"))

-- ============================================
-- Helpers
-- ============================================
local function cycle_layout()
  local layouts = { "dwindle", "master", "scrolling", "monocle" }
  local current = hl.get_config("general.layout") or "dwindle"

  local next_index = 1
  for i, l in ipairs(layouts) do
    if l == current then
      next_index = i % #layouts + 1
      break
    end
  end

  hl.config({ general = { layout = layouts[next_index] } })
end
hl.bind("CTRL + space", cycle_layout)

hl.bind("SUPER + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
