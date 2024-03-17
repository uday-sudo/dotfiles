#!/usr/bin/env zsh



case $1 in
    c)  cliphist list | rofi -dmenu -theme ~/.config/rofi/catpuccin-mocha-dmenu.rasi | cliphist decode | wl-copy
        ;; 
    d)  cliphist list | rofi -dmenu -theme ~/.config/rofi/catpuccin-mocha-dmenu.rasi | cliphist delete
        ;;
    w)  if [[ "$(echo -e "Yes\nNo" | rofi -dmenu -theme ~/.config/rofi/catpuccin-mocha-dmenu.rasi)" -eq "Yes" ]] ; then
            cliphist wipe
        fi
        ;;
    *)  echo -e "cliphist.sh [action]"
        echo "c :  cliphist list and copy selected"
        echo "d :  cliphist list and delete selected"
        echo "w :  cliphist wipe database"
        exit 1
        ;;
esac

