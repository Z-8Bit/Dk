#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')
rofi_command="rofi -theme ~/.config/rofi/wifi-power.rasi"

# Options
bluetooth="bluetooth"
desktop="modern-family"
update="update"
dk="dk"
rofi="rofi"
polybar="polybar"
dunst="dunst"
picom="picom"
alacritty="alacritty"

# Variable passed to rofi
options="$bluetooth\n$desktop\n$update\n$dk\n$rofi\n$polybar\n$dunst\n$picom\n$alacritty"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $polybar)
		alacritty -e vim ~/.config/polybar/
        ;;
    $rofi)
		alacritty -e vim ~/.config/rofi/
        ;;
    $update)
    alacritty -e paru -Syu --ignore fluent-gtk-theme-git
        ;;
    $desktop)
    thunar Desktop/Modern\ Family\ 2009\ Season\ 11/
        ;;
    $bluetooth)
    alacritty -e ./blue.sh
        ;;
    $dk)
    alacritty -e vim ~/.config/dk/
    ;;
    $dunst)
    alacritty -e vim ~/.config/dunst/
    ;;
    $picom)
    alacritty -e vim ~/.config/picom.conf
    ;;
    $alacritty)
    alacritty -e vim ~/.config/alacritty/alacritty.yml
esac
1
