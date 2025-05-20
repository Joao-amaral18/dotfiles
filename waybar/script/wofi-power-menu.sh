#!/bin/bash
hyprshade dim &
SHADE_PID=$!
chosen=$(printf "Logout\nReboot\nShutdown" | wofi --dmenu --width 300 --height 250 --no-input --prompt "Power Menu")
kill $SHADE_PID

case "$chosen" in
  Logout) hyprctl dispatch exit ;;
  Reboot) systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac