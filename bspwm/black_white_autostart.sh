#!/bin/bash

function run {
    if ! grep $1 ;
    then
        $@&
    fi
}

export main_screen=HDMI-0
export side_screen=eDP-1-1

# --- Wallpaper and Color stuffs ---
declare scheme=${HOME}/.cache/wal/schemes/black_white.json
wal --theme $scheme -q &
 . "${HOME}/.cache/wal/colors.sh" &

# --- Desktop and Monitor Stuff ---
if xrandr -q | grep -w connected | grep "$main_screen" 1>/dev/null; then
    xrandr --output "$main_screen" --primary --mode 1920x1080 --rotate normal --left-of "$side_screen" &
    sleep 1    
    bspc monitor "$main_screen" -d 1 2 3 4 5
    bspc monitor "$side_screen" -d 6 7 8 9 0
    # pgrep -x glava > /dev/null || glava --desktop --entry=rc2.glsl &
else
    bspc monitor -d 1 2 3 4 5 6 7 8 9 0
fi
# pgrep -x glava > /dev/null || glava --desktop &


setxkbmap -option caps:escape

# --- Lauch Stuffs ---
picom --config ~/.config/picom.conf &
run $HOME/.config/polybar/blackblocks/launch.sh &
run sxhkd &

