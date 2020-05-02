#!/bin/bash

# Dependencies:
# ffmpeg
# i3lock-color-git


set -e


IMAGE=/tmp/i3lock.png
TEXT="Locked"
RES="1920x1080"
IX=20
IY=699
X=50
Y=1040
BLUR=20
FONT="SF Mono\:style=Bold"
FCOLOR="#d9d7ce"
FSIZE=20
SCOLOR="#212733d0"
SX=1
SY=1
CLVL=0.05

if [[ $1 != "" ]]; then
    TEXT=$1
fi

ffmpeg -f x11grab \
    -video_size $RES \
    -y -i $DISPLAY \
    -vf "colorlevels=rimin=$CLVL:gimin=$CLVL:bimin=$CLVL,boxblur=$BLUR,drawtext='font=$FONT:text=$TEXT:fontcolor=$FCOLOR:fontsize=$FSIZE':x=$X:y=$Y:shadowcolor=$SCOLOR:shadowx=$SX:shadowy=$SY" \
    -vframes 1 \
    $IMAGE


xset s off dpms 0 10 0

i3lock --nofork -i $IMAGE \
    --line-uses-inside \
    --insidecolor=00000000 --insidevercolor=00000000 --insidewrongcolor=00000000 \
    --ringcolor=d9d7ceff --ringvercolor=d9d7ceff --ringwrongcolor=ed8274ff \
    --keyhlcolor=ed8274ff --bshlcolor=ed8274ff --separatorcolor=00000000 \
    --radius=5 --ring-width=3 --veriftext="" --wrongtext="" \
    --indpos="x+$IX:y+$IY"

xset s off -dpms


rm $IMAGE
