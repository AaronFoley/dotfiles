#!/usr/bin/env python3.3
#
# Print i3 workspaces and output on every change.
#
# Format:
#   output seperated by commas
#   x = workspace name
#       - "FOCx" -> Focused workspace
#       - "INAx" -> Inactive workspace
#       - "ACTx" -> Ative workspace
#       - "URGx" -> Urgent workspace
#
# e.g. FOC1, INA2, INA3
#

import sys
import time
import subprocess

import i3ipc


def get_ws_state(workspace,output):
    if workspace['focused']:
        if output['current_workspace'] == workspace['name']:
            return 'FOC'
        else:
            return 'ACT'
    if workspace['urgent']:
        return 'URG'
    else:
        return 'INA'


class i3Listener(object):

    def __init__(self):

        self.conn = i3ipc.Connection()

        # Subscribe to Events
        self.conn.on('mode', self.on_mode)
        self.conn.on('workspace', self.on_workspace)

    # Start the main loop and wait for events to come in.
    def start(self):
        self.on_workspace(self.conn, None)
        # Display workspaces on start
        self.conn.main()

    # Reacts to a workspace event
    def on_workspace(self,i3,event):

        i3outputs = self.conn.get_outputs()
        i3workspaces = self.conn.get_workspaces()

        # Get the number of active screens
        out = [''] * sum(op['active'] for op in i3outputs);

        # For each Workspace
        for workspace in i3workspaces:
            output = None
            # Find the output this ws in on
            for op in i3outputs:
                if op['name'] == workspace['output']:
                    output = op
                    break
            # If this is not on any output -- Weird
            if not output:
                continue

            # Now Pharse the state info
            state = get_ws_state(workspace,output)
            name = workspace['name']
            # Work out which screen this workspace is on
            screen = int(output['rect']['x']/1920)

            out[screen] += '%s%s ' % (state,name)

        self.display('WSP%s' % ",".join([sr.strip() for sr in out]))

    # Reacts to a workspace event
    def on_mode(self,i3,event):
        self.display('MDE' + event.change)

    # Displays in STD out
    def display(self, text):
        print('I3' + text)
        sys.stdout.flush()

    # Close Connection on quit
    def quit(self):
        self.conn.main_quit()

if __name__ == '__main__':
    ws = i3Listener()
    try:
        ws.start()
    except KeyboardInterrupt:
        print('')  # horse new line
    finally:
        ws.quit()
