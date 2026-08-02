#!/bin/bash

v=$(hyprctl getoption decoration:rounding | grep -o "[0-9]\+" | head -n1)

if [ "$v" -eq 0 ]; then
    sed -i -E 's/^(source *= *").*(")/\1wallpaper\2/' /home/firmino/.config/noctalia/settings.toml
    noctalia msg config-reload
    hyprctl reload
    noctalia msg bar-show default
    noctalia msg bar-hide barFocus
else
    sed -i -E 's/^(source *= *").*(")/\1custom\2/' /home/firmino/.config/noctalia/settings.toml
    noctalia msg config-reload
    sleep 0.3

    noctalia msg bar-hide default
    noctalia msg bar-show barFocus
    hyprctl eval 'hl.config({general = {gaps_in = 0}})'
    hyprctl eval 'hl.config({general = {gaps_out = 0}})'
    hyprctl eval 'hl.config({general = {border_size = 0}})'
    hyprctl eval 'hl.config({decoration = {rounding = 0}})'
fi


