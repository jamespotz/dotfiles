hl.on("hyprland.start", function()
  -- Chain the environment update and portal restarts sequentially to prevent race conditions
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland && systemctl --user start xdg-desktop-portal-hyprland xdg-desktop-portal")

  -- Auto delete trash 30 days old
  hl.exec_cmd("trash-empty 30")

  -- Cursors
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

  hl.exec_cmd("systemctl --user start hyprland-session.target")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("awww-daemon &")
  hl.exec_cmd("mpris-proxy")

  hl.exec_cmd("sh ~/.config/hypr/helios-reload.sh &")
end)
