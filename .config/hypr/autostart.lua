hl.on("hyprland.start", function()
  -- 1. Register all environment variables immediately
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- 2. Safely cycle the portal state so it grabs the fresh environment variables
  hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland")
  hl.exec_cmd("sleep 0.5 && systemctl --user start xdg-desktop-portal-hyprland")

  -- 3. Trigger your systemd targets and background daemons
  hl.exec_cmd("systemctl --user start hyprland-session.target")
  hl.exec_cmd("noctalia")
  -- hl.exec_cmd("pypr")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
