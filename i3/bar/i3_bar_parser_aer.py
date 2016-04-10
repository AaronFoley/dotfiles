#!/usr/bin/env python
#
# Input parser for i3 bar ... fuck bash

import os
import sys

def right_segment(bg,fg,text,start=False,end=False):

    line = ''

    if ( text != '' ):
        # If not the start segment, print the preceding sperator
        if ( not start ):
            line += "%{ B" + bg + " }" + os.getenv('sep_right')

        # setup the segement colours
        line += "%{ B" + bg + " F" + fg + " }"

        # print out the text
        line += os.getenv('stab') + text + os.getenv('stab')

        # setup the next segment
        line += "%{ F" + bg + " }"

    # if this is the last one, print out the ending segement character
    if ( end ):
        line += "%{ B- }" + os.getenv('sep_right') + "%{ F- }"

    return line

def left_segment(bg,fg,text):
    return "%{ F" + bg + " }" + os.getenv('sep_left') + "%{ B" + bg + " F" + fg + " }" + os.getenv('stab') + text + os.getenv('stab') + "%{ F" + bg + " }"

class parser():
    data = {}

    def __init__(self):
        # Intialise things that can't be empty..
        self.data['i3mode'] = ''
        self.run()

    def parse_conky(self, line):
        arr = line.split(",")

        self.data['uptime']  = arr[0]
        self.data['cpu']     = arr[1]
        self.data['memory']  = arr[2]
        self.data['volume']  = arr[3]
        self.data['date']    = arr[4]
        self.data['power']   = arr[5]
        self.data['power_status']   = arr[6]

    def parse_i3mode(self, line):
        if line == "default":
            self.data['i3mode'] = ''
        else:
            bg = os.getenv('color_i3_bg_mode')
            fg = os.getenv('color_i3_fg_mode')
            self.data['i3mode'] = right_segment(bg, fg, line)

    def parse_i3workspaces(self, line):
        screens = line.split(",")

        # Intialise screens
        self.data['screens'] = []

        # Loop through each screen
        for screen in screens:
            workspaces = screen.strip().split(" ")

            wsline = ''

            # Print out the first workspace
            bg = os.getenv('color_ws_bg_' + workspaces[0][:3])
            fg = os.getenv('color_ws_fg_' + workspaces[0][:3])
            text = workspaces[0][3:]
            wsline += "%{A:i3-msg workspace " + workspaces[0][3:] + ":}" + right_segment(bg, fg, text, start=True) + "%{A}"

            # loop the inbetween workspaces
            for workspace in workspaces[1:]:
                bg = os.getenv('color_ws_bg_' + workspace[:3])
                fg = os.getenv('color_ws_fg_' + workspace[:3])
                text = workspace[3:]
                wsline += "%{A:i3-msg workspace " + workspace[3:] + ":}" + right_segment(bg, fg, text) + "%{A}"

            # Add it to screens array
            self.data['screens'].append(wsline)


    def run(self):
        for line in sys.stdin:
            # Remove the new line at the end
            line = line[:-1]

            if line[:5] == "CONKY":
                self.parse_conky(line[5:])
            elif line[:5] == "I3WSP":
                self.parse_i3workspaces(line[5:])
            elif line[:5] == "I3MDE":
                self.parse_i3mode(line[5:])
            try:
                self.display()
            except KeyError:
                print('')  # force new line

    def display(self):
        line = ''
        rhs = ''

        # Figure out the RHS
        if 'uptime' in self.data:
            rhs += left_segment(os.getenv('color_uptime_bg'),   os.getenv('color_uptime_fg'),   os.getenv('icon_uptime') + ' ' + self.data['uptime'])
            rhs += left_segment(os.getenv('color_cpu_bg'),      os.getenv('color_cpu_fg'),      os.getenv('icon_cpu') + self.data['cpu'] )
            rhs += left_segment(os.getenv('color_memory_bg'),   os.getenv('color_memory_fg'),   os.getenv('icon_memory') + self.data['memory'])
            rhs += left_segment(os.getenv('color_volume_bg'),   os.getenv('color_volume_fg'),   os.getenv('icon_volume') + self.data['volume'])
            rhs += left_segment(os.getenv('color_power_bg'),    os.getenv('color_power_fg'),    self.data['power_status'] == 'Discharging' ?  os.getenv('icon_power') : os.getenv('icon_power_charging') + self.data['power'])
            rhs += left_segment(os.getenv('color_clock_bg'),    os.getenv('color_clock_fg'),    os.getenv('icon_clock') + self.data['date'])

        # print the screens
        for index, screen in enumerate(self.data['screens']):
            line += '%{S' + str(index) + 'l}' + screen + self.data['i3mode'] + right_segment('', '', '',end=True)
            line += '%{r}' + rhs + "%{ F-  B-}"

        print(line, flush=True);

if __name__ == '__main__':
    try:
        parser()
    except KeyboardInterrupt:
        print('')  # force new line
