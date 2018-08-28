#!/bin/bash
PIDS=`ps -ef |grep conky |grep -v grep | awk '{print $2}'`
if [ "$PIDS" != "" ]; then
    killall conky
fi

if [ "$1" == "" ]; then
    sleep 10 #time (in s) for the DE to start; use ~20 for Gnome or KDE, less for Xfce/LXDE etc
fi

CURRENT_PATH=$(cd `dirname $0`; pwd)
cd $CURRENT_PATH
conky -c rings -d & # the main conky with rings
sleep 1 #time for the main conky to start; needed so that the smaller ones draw above not below (probably can be lower, but we still have to wait 5s for the rings to avoid segfaults)
conky -c cpu -d &
conky -c mem -d &
conky -c network -d &
conky -c clock -d &
conky -c arch_logo -d &
#conky -c notes &