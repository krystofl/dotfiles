#!/bin/bash

# use only the working part of spectre's display

# Create the modeline:
# $ cvt 1440 1080
# 1440x1080 59.99 Hz (CVT 1.56M3) hsync: 67.19 kHz; pclk: 129.00 MHz
# Modeline "1440x1080_60.00"  129.00  1440 1528 1680 1920  1080 1083 1087 1120 -hsync +vsync


# Create the mode; gonna call it BROKEN:
xrandr --newmode BROKEN 129.00  1440 1528 1680 1920  1080 1083 1087 1120 -hsync +vsync

# Add it:
xrandr --addmode eDP-1 BROKEN

# Set it as the output:
xrandr --output eDP-1 --fb 1440x1080 --panning 1440x1080 --mode BROKEN

# Shift it:
xrandr --fb 1440x1080 --output eDP-1 --mode 1920x1080
