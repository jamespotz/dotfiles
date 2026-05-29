#!/bin/bash
# Mango wrapper script - sets environment variables before launching mango

# Clear LD_PRELOAD to avoid compatibility issues
export LD_PRELOAD=""

# Wayland support for applications
export MOZ_ENABLE_WAYLAND="1"
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="mango"
export XDG_SESSION_DESKTOP="mango"
export MOZ_DBUS_REMOTE="1"
export GDK_BACKEND="wayland"
export QT_AUTO_SCREEN_SCALE_FACTOR="1"
export QT_WAYLAND_FORCE_DPI="physical"
export EGL_PLATFORM="wayland"
export CLUTTER_BACKEND="wayland"

# Java and Electron app support
export _JAVA_AWT_WM_NONREPARENTING="1"
export ELECTRON_OZONE_PLATFORM_HINT="auto"

# Qt theming
export QT_QPA_PLATFORMTHEME="qt6ct"

# GPU/VRR settings
export __GL_VRR_ALLOWED="1"
export __GL_GSYNC_ALLOWED="1"

# Launch mango
exec mango "$@"
