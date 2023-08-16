#!/bin/bash

## Requires: wget and notify-send (libnotify-bin & libnotify)

## Individual scripts per season included
## REPEATS skipped. Missing skipped. All English episodes listed

echo -en "\n\nAm I in the Computer Chronicles directory? y/n ==> "
read yaknow

if [[ "$yaknow" == "n" ]]; then
    echo -en "\n\ncd and I'll see thee again\n\n"
    exit 0
else
    echo -en "\n\nAlright, Let's do this..\n\n"
    sleep 5
fi

ccsn=1

while true
do
    cd "Season $ccsn"
    "./season${ccsn}.sh"
    #echo "isee $ccsn.txt"
    ccsn="$(($ccsn + 1))"
    cd ..
    sleep 1
    if [[ $ccsn == 20 ]]; then
        notify-send "Computer Chronicles: COMPLETED"
        exit 0
    fi
done
