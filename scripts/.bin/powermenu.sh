#!/usr/bin/env bash

RET=$(echo -e "cancel\nlogout\nreboot\nshutdown" | dmenu -p 'Logout' -fn 'JetBrainsMono Nerd Font:pixelsize=22')

case $RET in
    shutdown) systemctl poweroff ;;
    reboot) systemctl reboot ;;
    logout) i3-msg exit ;;
    *) ;;
esac
