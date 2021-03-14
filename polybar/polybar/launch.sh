#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# do we have a second monitor?
monitor_count=$(monitor-count)

case $monitor_count in
  1)
    polybar -c ~/.config/polybar/config.ini top-main &
  ;;
  2)
    polybar -c ~/.config/polybar/config.ini top-main &
    polybar -c ~/.config/polybar/config.ini top-external &
  ;;
  3)
    polybar -c ~/.config/polybar/config.ini top-main &
    polybar -c ~/.config/polybar/config.ini top-external &
  ;;
esac

