#!/usr/bin/env bash
# TABBED WINDOWS:
# Switches between tabbed windows if the active windows is grouped.
#
# FLOATING/TILED WINDOWS:
# Switches between non-grouped windows.
# Gather the direction in which the arrow was pressed (l,r,u,d).
DIRECTION="$1"
shift;

# Grouped windows are comma-separated by window addresses.
WINDOW_IS_GROUPED=1
if [[ "$(hyprctl activewindow | rg "grouped: (.*$)" -o --replace='$1')" = "0" ]]; then
  WINDOW_IS_GROUPED=0
fi

# TABBED WINDOWS
if [[ $WINDOW_IS_GROUPED != 0 ]]; then

  if [[ $DIRECTION = "l" ]]; then
    hyprctl dispatch changegroupactive b
  elif [[ $DIRECTION = "r" ]]; then
    hyprctl dispatch changegroupactive f
  fi

# FLOATING/TILED WINDOWS:
else
  hyprctl dispatch movefocus "$DIRECTION"
fi

exit 0