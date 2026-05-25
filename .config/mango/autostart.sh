#!/bin/bash
# Mango autostart script

set +e

systemctl --user start mangowc-session.target
# Noctalia shell
qs -c noctalia-shell &
