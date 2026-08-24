-- Set programs that you use
local terminal    = "ghostty"
local fileManager = "nautilus"
local browser     = "app.zen_browser.zen"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + ALT + r",
  hl.dsp.exec_cmd("hyprctl reload | notify-send '🗱 Hyprland Reloaded!'"), { description = "Reload Hyprland" })

-- ============================================
-- Window Movement (SUPER + Shift + Arrows)
-- ============================================
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "up" }), { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "down" }),
  { description = "Move window down" })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.layout("swapcol l"), { description = "Swap column left" })
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.layout("swapcol r"), { description = "Swap column right" })

-- ============================================
-- Window States & Actions
-- ============================================

-- Window Resizing
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 10, y = 0 }), { description = "Grow window width" })
hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -10, y = 0 }), { description = "Shrink window width" })
hl.bind(mainMod .. " + CTRL + equal", hl.dsp.window.resize({ x = 0, y = 10 }),
  { description = "Grow window height" })
hl.bind(mainMod .. " + CTRL + minus", hl.dsp.window.resize({ x = 0, y = -10 }),
  { description = "Shrink window height" })

hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })

-- Toggle Tab
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next(), { description = "Cycle to next window" })

-- Fullscreen and maximize
hl.bind("ALT + f", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind("ALT + SHIFT + f", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })
hl.bind("ALT + a", hl.dsp.window.fullscreen(), { description = "Toggle fullscreen" })

-- Scratchpad
hl.bind("ALT + z", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })

-- ============================================
-- Helpers
-- ============================================
local function cycle_layout()
  local layouts = { "dwindle", "master", "scrolling", "monocle" }
  local current = hl.get_config("general.layout") or "dwindle"
  local layout_icons = {
    dwindle = "󰕰",
    master = "󰯌",
    scrolling = "󰹹",
    monocle = "󰍹",
  }

  local next_index = 1
  for i, l in ipairs(layouts) do
    if l == current then
      next_index = i % #layouts + 1
      break
    end
  end


  local next_layout = layouts[next_index]
  local icon = layout_icons[next_layout] or "󰖯"
  hl.config({ general = { layout = next_layout } })

  hl.dispatch(
    hl.dsp.exec_cmd(
      "notify-send 'Layout' '" .. icon .. "  " .. next_layout .. "'"
    )
  )
end
hl.bind(mainMod .. "+ ALT + space", cycle_layout, { description = "Cycle layout" })
hl.bind(mainMod .. "+ R", hl.dsp.layout("colresize +conf"), { description = "Confirm column resize" })
hl.bind(mainMod .. "+ F", hl.dsp.layout("fit_into_view"), { description = "Fit window into view" })

-- Screnshot
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'),
  { description = "Screenshot region to clipboard" })
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"),
  { description = "Screenshot full screen to clipboard" })

hl.bind(mainMod .. " +B", hl.dsp.exec_cmd("helium"), { description = "Open Helium browser" })
hl.bind(mainMod .. " +ALT +B", hl.dsp.exec_cmd("flatpak run " .. browser), { description = "Open Zen browser" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), { description = "Open terminal" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
  { description = "Shutdown / exit Hyprland" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager), { description = "Open file manager" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Toggle pseudotile" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle split (dwindle only)" })

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus down" })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }),
    { description = "Switch to workspace " .. key })
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }),
    { description = "Move window to workspace " .. key })
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.workspace.toggle_special("magic"),
  { description = "Toggle special workspace" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }),
  { description = "Move window to special workspace" })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }),
  { description = "Focus next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }),
  { description = "Focus previous workspace" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Drag window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true, description = "Raise volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true, description = "Lower volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true, description = "Toggle mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true, description = "Toggle mic mute" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true, description = "Raise brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true, description = "Lower brightness" })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous track" })
