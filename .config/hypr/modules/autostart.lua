hl.on("hyprland.start", function()
  -- Export fresh env to systemd/dbus before (re)starting portals, otherwise
  -- xdg-desktop-portal-hyprland keeps a stale WAYLAND_DISPLAY from a
  -- previous Hyprland instance and fails with "Couldn't connect to a
  -- wayland compositor" until manually restarted.
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Auto delete trash 30 days old
  hl.exec_cmd("trash-empty 30")

  -- Restart portals so they catch the environment
  hl.exec_cmd("systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland")
  hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland xdg-desktop-portal")

  -- Cursors
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

  hl.exec_cmd("systemctl --user start hyprland-session.target")
  hl.exec_cmd("sh ~/.config/hypr/helios-reload.sh &")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("awww-daemon &")
end)
