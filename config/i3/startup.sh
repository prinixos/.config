#   ___
#  |  _ \  _ __ (_) _ __  (_)__  __ ___   ___
#  | |_) || '__|| || '_ \ | |\ \/ // _ \ / __|
#  |  __/ | |   | || | | || | >  <| (_) |\__ \
#  |_|    |_|   |_||_| |_||_|/_/\_\\___/ |___/
#
#  Github :: https://github.com/prinixos

#!/bin/bash
xbacklight -set 30 &
$HOME/.config/polybar/launch.sh --shapes &
nitrogen --restore &
dunst &
picom &
nm-applet &
unclutter --timeout 1 &
kdeconnect-cli -l &
alacritty -e gotop &
python ~/.config/youtube-local/server.py &
