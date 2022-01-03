#!/usr/bin/env bash

scrot -s -q 100 -o ~/Pictures/screenshot.png
paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &
mogrify -crop +1+1 -crop -1-1 +repage ~/Pictures/screenshot.png
xclip -sel clip -t image/png -i ~/Pictures/screenshot.png
