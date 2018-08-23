#!/bin/bash
killall conky

CURRENT_PATH=$(cd `dirname $0`; pwd)

#sleep 10 #time (in s) for the DE to start; use ~20 for Gnome or KDE, less for Xfce/LXDE etc
conky -c $CURRENT_PATH/rings -d & # the main conky with rings
#sleep 1 #time for the main conky to start; needed so that the smaller ones draw above not below (probably can be lower, but we still have to wait 5s for the rings to avoid segfaults)
conky -c $CURRENT_PATH/cpu -d &
conky -c $CURRENT_PATH/mem -d &
conky -c $CURRENT_PATH/network -d &
conky -c $CURRENT_PATH/clock -d &
conky -c $CURRENT_PATH/arch_logo -d &
#conky -c $CURRENT_PATH/notes &
