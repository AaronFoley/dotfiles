#!/bin/bash

ssh $1 mkdir -p .terminfo/r
scp /usr/share/terminfo/r/rxvt-unicode* $1:.terminfo/r/
