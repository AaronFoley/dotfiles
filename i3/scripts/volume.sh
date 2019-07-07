#!/bin/sh

case $BLOCK_BUTTON in
    1) setsid pavucontrol &;;
    2) ponymix toggle > /dev/null;;
    4) ponymix increase 5 > /dev/null;;
    5) ponymix decrease 5 > /dev/null;;
esac

ponymix | egrep -o "([0-9]+%.*)" -m 1