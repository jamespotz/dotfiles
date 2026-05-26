#!/bin/bash

set +e

# some env can't auto run the portal, so need this
/usr/libexec/xdg-desktop-portal-wlr >/dev/null 2>&1 &

wl-paste --watch cliphist store &

systemctl --user start mango-session.target
