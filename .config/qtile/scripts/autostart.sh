#!/bin/sh
picom &
nitrogen --random --set-zoom-fill &
xfce4-clipman &
nm-applet &
blueman-applet &
xfce4-power-manager &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &
dunst -config $HOME/.config/qtile/dunstrc &
kmix &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
udiskie &
