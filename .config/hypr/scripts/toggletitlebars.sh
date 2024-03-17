#!/usr/bin/env sh

case "$1" in
  t)
    if [[ "$(hyprctl plugin list)" == *"hyprbars"* ]]; then
      hyprctl plugin unload ~/.config/hypr/plugins/hyprbars.so
    else
      hyprctl plugin load ~/.config/hypr/plugins/hyprbars.so
    fi
	;;
esac
