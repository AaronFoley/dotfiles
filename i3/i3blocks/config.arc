################################################
# i3blocks config
################################################

# Global properties
command=/usr/libexec/i3blocks/$BLOCK_NAME
separator_block_width=20
markup=none

# Battery
[power]
command=~/.config/i3/scripts/battery.sh
interval=30

# Volume
[volume]
label= 
command=ponymix | egrep -o "([0-9]+%.*)" -m 1
interval=5

[time]
label=
command=date '+%Y-%m-%d %H:%M:%S'
interval=1
