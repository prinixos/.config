#   ___
#  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
#  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
#  |  __/ | |   | || | | || | >  <| (_) |\__ \
#  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
#
#  Github :: https://github.com/prinixos

#!/bin/bash
$HOME/.config/polybar/launch.sh --docky &
nitrogen --restore &
dunst &
picom &
nm-applet &
unclutter --timeout 1 &
xfce4-power-manager &
xbacklight -set 10 &
python ~/.config/youtube-local/server.py &
# kdeconnect-cli -l &
# telegram-desktop &
