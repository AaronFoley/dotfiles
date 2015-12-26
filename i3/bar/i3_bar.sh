#! /bin/bash
#
# I3 bar with https://github.com/LemonBoy/bar

# Include the configuration
. $(dirname $0)/i3_bar_config

# Check if the bar is already running
if [ $(pgrep -cx $(basename $0)) -gt 1 ] ; then
    printf "%s\n" "The status bar is already running." >&2
    exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

# Create the panel output file
[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

# Get Information from conky
conky -c $(dirname $0)/i3_bar_conky > "${panel_fifo}" &

#Get Information about i3
$(dirname $0)/i3_listener.py > "${panel_fifo}" &

# Loop fifo
$(dirname $0)/i3_bar_parser.py < "${panel_fifo}" \
  | lemonbar -p -g "${geometry}" -B "${color_bg}" -F "${color_fg}" \
        -f "${font1}" \
        -f "${font2}" \
        -f "${font3}" \
        -f "${font4}" \
        -f "${font5}" \
  | while read line; do eval "$line"; done &
wait
