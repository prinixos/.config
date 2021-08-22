#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

THEME="$HOME/.config/rofi/modules/configs/menu.rasi"

# comment these lines to disable random style
#themes=($(ls -p --hide="launcher.sh" $dir))
#theme="${themes[$(( $RANDOM % 16 ))]}"

rofi -no-lazy-grab -show drun -modi drun -theme $THEME
