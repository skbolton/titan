include:
  - sxhkd

bspwm:
  pkg.installed

bspwm-config-directory:
  file.directory:
    - name: /home/orlando/.config/bspwm
    - user: orlando

bspwm-config:
  file.symlink:
    - name: /home/orlando/.config/bspwm/bspwmrc
    - target: /home/orlando/titan/bspwm/bspwmrc
    - user: orlando
    - force: True

monitor-count:
  file.managed:
    - name: /home/orlando/.local/bin/monitor-count
    - user: orlando
    - contents: |
        xrandr --query | rg "\bconnected" --count

setup-monitors:
  file.managed:
    - name: /home/orlando/.local/bin/setup-monitors
    - user: orlando
    - contents: |
        monitors=$(monitor-count)
        case $monitors in
          1)
            echo "one"
            xrandr \
              --output DisplayPort-0 \
                --primary \
                --mode 5120x2160 \
                --pos 1440x1440 \
                --rotate normal \
          ;;
          2)
            echo "two"
            xrandr \
              --output DisplayPort-0 \
                --primary \
                --mode 5120x2160 \
                --pos 1440x1440 \
                --rotate normal \
              --output DisplayPort-1 \
                --mode 2560x1440 \
                --pos 2720x0 \
                --rotate normal \
          ;;
          3)
            echo "three"
            xrandr \
              --output DisplayPort-0 \
                --primary \
                --mode 5120x2160 \
                --pos 1440x1440 \
                --rotate normal \
              --output DisplayPort-1 \
                --mode 2560x1440 \
                --pos 2720x0 \
                --rotate normal \
              --output HDMI-A-0 \
                --mode 2560x1440 \
                --pos 0x1240  \
                --rotate right \
          ;;
        esac

bspwm-specific-sxhkd:
  file.symlink:
    - name: /home/orlando/.config/bspwm/bspwm-sxhkdrc
    - target: /home/orlando/titan/bspwm/bspwm-sxhkdrc
    - user: orlando
    - force: True
