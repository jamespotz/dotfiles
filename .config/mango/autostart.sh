#!/bin/bash
# Mango autostart script

set +e

# Import environment for systemd
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE

/usr/libexec/xdg-desktop-portal-wlr &

# gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
# gsettings set org.gnome.desktop.interface cursor-size 24 
# gsettings set org.gnome.desktop.interface cursor-theme "Twilight-cursors"
# Noctalia shell (your preferred launcher/panel)
qs -c noctalia-shell &
