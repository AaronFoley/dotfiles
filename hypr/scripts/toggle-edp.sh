#!/bin/bash

# if hyprctl monitors |grep "Monitor eDP-1" > /dev/null; then
#     hyprctl keyword monitor "eDP-1, disable"
# else
#     hyprctl keyword monitor "eDP-1, highrr, auto, 1"
# fi;

CONFIG_FILE="$HOME/.config/hypr/monitors.conf"
LINE='monitor=desc:AU Optronics 0x243D,disable'

if grep -Fxq "$LINE" "$CONFIG_FILE"; then
  # Line exists, remove it
  grep -Fxv "$LINE" "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
  echo "Removed line: $LINE"
else
  # Line doesn't exist, add it after the first matching monitor
  awk -v new_line="$LINE" '
    BEGIN {added=0}
    !added && $0 ~ /^monitor=desc:AU Optronics 0x243D/ && $0 !~ /disable/ {
      print
      print new_line
      added=1
      next
    }
    { print }
  ' "$CONFIG_FILE" > "$CONFIG_FILE.tmp" && mv "$CONFIG_FILE.tmp" "$CONFIG_FILE"
  echo "Added line: $LINE"
fi

# Reload waybar
if pgrep -x waybar >/dev/null; then
    pkill -USR2 waybar
else
    uwsm app -- waybar & disown
fi

# Reload hyprpaper
