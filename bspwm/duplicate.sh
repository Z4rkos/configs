#!/bin/bash 

readarray -d '' cmd </proc/$(xdotool getactivewindow getwindowpid)/cmdline
eval ${cmd[@]@Q}
