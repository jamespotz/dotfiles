-- Set programs that you use
local terminal    = "ghostty"
local fileManager = "nautilus"
local browser     = "app.zen_browser.zen"

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + ALT + r",
  hl.dsp.exec_cmd("hyprctl reload | notify-send '🗱 Hyprland Reloaded!'"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd("pkill noctalia && sleep 1 && nohup noctalia &"))

-- ============================================
-- Window Movement (SUPER + Shift + Arrows)
-- ============================================
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.layout("swapcol r"))

-- ============================================
-- Window States & Actions
-- ============================================

-- Window Resizing
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 10, y = 0 }))
hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -10, y = 0 }))
hl.bind(mainMod .. " + CTRL + equal", hl.dsp.window.resize({ x = 0, y = 10 }))
hl.bind(mainMod .. " + CTRL + minus", hl.dsp.window.resize({ x = 0, y = -10 }))

hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))

-- Toggle Tab
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next())

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
hl.bind(mainMod .. "+ ALT + space", cycle_layout)
hl.bind(mainMod .. "+ R", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. "+ F", hl.dsp.layout("fit_into_view"))

-- Screnshot
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

hl.bind(mainMod .. " +B", hl.dsp.exec_cmd("helium"))
hl.bind(mainMod .. " +ALT +B", hl.dsp.exec_cmd("flatpak run " .. browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + ALT + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Noctali binds
local ipc = "noctalia msg"
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. "+X", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
