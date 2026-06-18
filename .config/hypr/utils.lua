local Utils = {}

local function hypr_path(name)
  local home = os.getenv("HOME")
  local config_home = os.getenv("XDG_CONFIG_HOME")

  if config_home == nil or config_home == "" then
    config_home = home .. "/.config"
  end

  return config_home .. "/hypr/" .. name .. ".lua"
end

local function notify(title, message)
  pcall(function()
    os.execute(string.format("notify-send %q %q", title, message))
  end)
end

function Utils.safe_load(name)
  local path = hypr_path(name)

  local ok, err = pcall(dofile, path)

  if not ok then
    print("[Hyprland Lua] Failed to load: " .. path)
    print(err)

    notify("Hyprland Lua Error", "Failed to load " .. name .. ".lua")
  end

  return ok
end

return Utils
