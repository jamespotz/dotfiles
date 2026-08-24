hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  -- Export variables to systemd
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Restart portals so they catch the environment
  hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland")
  hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland xdg-desktop-portal")

  hl.exec_cmd("systemctl --user start hyprland-session.target")
  -- hl.exec_cmd("noctalia")
  hl.exec_cmd("quickshell -c helios")
  -- hl.exec_cmd("pypr")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("hyprpm reload")
end)
