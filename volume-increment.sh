#!/bin/sh

# based on http://askubuntu.com/questions/10525/how-can-i-make-the-volume-change-in-smaller-increments
# and http://blog.waan.name/pulseaudio-setting-volume-from-command-line/
# adopting the former to work with pulse audio

usage="usage: $0 -c {up|down|mute} [-i increment] [-m mixer]"
command=
increment=5%
mixer=Master

SINK_NAME=$(pactl stat | grep "alsa_output" | perl -a -n -e 'print $F[2]')

while getopts c:i:m:h o
do case "$o" in
    c) command=$OPTARG;;
    i) increment=$OPTARG;;
    m) mixer=$OPTARG;;
    h) echo "$usage"; exit 0;;
    ?) echo "$usage"; exit 0;;
esac
done

#echo "command:$command"
#echo "increment:$increment"
#echo "mixer:$mixer"

if [ "$command" = "" ]; then
    shift $(($OPTIND - 1))
    command=$1
    exit 0;
fi

if [ "$command" = "" ]; then
    echo "usage: $0 {up|down|mute} [increment]"
    exit 0;
fi

display_volume=0

if [ "$command" = "up" ]; then
	# pactl -- set-sink-volume 1 +2%
	pactl -- set-sink-volume $SINK_NAME +$increment
    # display_volume=$(amixer set $mixer $increment+ unmute | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
fi

if [ "$command" = "down" ]; then
	pactl -- set-sink-volume $SINK_NAME -$increment
    # display_volume=$(amixer set $mixer $increment- unmute | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
fi

icon_name=""

if [ "$command" = "mute" ]; then
    if amixer get Master | grep "\[on\]"; then
        display_volume=0
        icon_name="notification-audio-volume-muted"
        amixer set $mixer mute
    else
        display_volume=$(amixer set $mixer unmute | grep -m 1 "%]" | cut -d "[" -f2|cut -d "%" -f1)
    fi
fi

if [ "$icon_name" = "" ]; then
    if [ "$display_volume" = "0" ]; then
        icon_name="notification-audio-volume-off"
    else
        if [ "$display_volume" -lt "33" ]; then
            icon_name="notification-audio-volume-low"
        else
            if [ "$display_volume" -lt "67" ]; then
                icon_name="notification-audio-volume-medium"
            else
                icon_name="notification-audio-volume-high"
            fi
        fi
    fi
fi

VOL_NOW=`pacmd dump | grep -P "^set-sink-volume $SINK_NAME\s+" | perl -p -n -e 's/.+\s(.x.+)$/$1/'`
display_volume=`echo "$(($VOL_NOW))/$((0x10000))*100" | bc -l | perl -p -n -e 's/\..*$//'`
notify-send " " -i $icon_name -h int:value:$display_volume -h string:synchronous:volume

#echo "icon: $icon_name and $display_volume"
