#!/bin/bash

# terminate already running bar instances
# if all your bars have ipc enabled, you can use
polybar-msg cmd quit
# otherwise do nuclear
#killall -q polybar

# xrandr 1.5+ fix
MONITOR=$(polybar -m | tail -1 | sed -e 's/:.*$//g')

# launch bars
echo "--- launched by $0 ---" | tee -a /tmp/polybar-main.log
polybar example 2>&1 | tee -a /tmp/polybar-main.log & disown

echo "launched all bars!"
