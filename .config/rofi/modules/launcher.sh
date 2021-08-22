#!/usr/bin/env bash

style="$($HOME/.config/rofi/modules/style.sh)"

dir="$style"

rofi_command="rofi -theme $dir/launcher.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if [[ -f /usr/bin/brave ]]; then
	app="brave"
elif [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

#for showing time
TIME="$(date +"%I:%M %p")"
DN=$(date +"%A")
# Links
power=""
screenshot=""
brightness=""
volume=""
wifi="﬉"
search=""


CHARGE="$(acpi | awk -F ' ' '{print $3}' | tr -d \,)"
BATTERY="$(acpi | awk -F ' ' '{print $4}' | tr -d \%,)"

active=""
urgent=""

if [[ $BATTERY -ge 5 ]] && [[ $BATTERY -le 19 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 20 ]] && [[ $BATTERY -le 39 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 40 ]] && [[ $BATTERY -le 59 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 60 ]] && [[ $BATTERY -le 79 ]]; then
    ICON_DISCHRG=""
elif [[ $BATTERY -ge 80 ]] && [[ $BATTERY -le 100 ]]; then
    ICON_DISCHRG=""
fi

if [[ $CHARGE = *"Charging"* ]]; then
    active="-a 1"
    ICON_CHRG=""
    MSG=$CHARGE
elif [[ $CHARGE = *"Full"* ]]; then
    active="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
else
    urgent="-u 1"
    ICON_CHRG=""
    MSG=$CHARGE
fi


# Variable passed to rofi
options="$wifi\n$power\n$screenshot\n$brightness\n$volume\n$search"


FILEDIR=~/.config/rofi/modules/

chosen="$(echo -e "$options" | $rofi_command -p "   $DN, $TIME  ||  $ICON_DISCHRG $BATTERY%$ICON_CHRG" -dmenu -selected-row 0)"
case $chosen in
    $wifi)
        $FILEDIR/network.sh
        ;;
    $power)
        $FILEDIR/powermenu.sh
        ;;
    $screenshot)
        $FILEDIR/screenshot.sh
        ;;
    $brightness)
        $FILEDIR/backlight.sh
        ;;
    $volume)
        $FILEDIR/volume.sh
        ;;
    $search)
        $FILEDIR/menu.sh
        ;;
esac

