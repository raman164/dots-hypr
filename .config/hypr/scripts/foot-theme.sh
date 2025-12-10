#!/bin/bash


THEME=$(ls /usr/share/foot/themes | wofi --dmenu)

if [ -n "$THEME" ]; then
    footclient --override "include=usr/share/foot/themes/$THEME" & 
fi
