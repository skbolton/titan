include:
  - sxhkd

bspwm:
  pkg.installed

bspwm-config-directory:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/.config/bspwm
    - user: {{ salt["environ.get"]("USER") }}

bspwm-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/bspwm/bspwmrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/bspwm/bspwmrc
    - user: {{ salt["environ.get"]("USER") }}
    - force: True

monitor-count:
  file.managed:
    - name: {{ salt["environ.get"]("HOME") }}/.local/bin/monitor-count
    - user: {{ salt["environ.get"]("USER") }}
    - contents: |
        xrandr --query | rg "\bconnected" --count

setup-monitors:
  file.managed:
    - name: {{ salt["environ.get"]("HOME") }}/.local/bin/setup-monitors
    - user: {{ salt["environ.get"]("USER") }}
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
    - name: {{ salt["environ.get"]("HOME") }}/.config/bspwm/bspwm-sxhkdrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/bspwm/bspwm-sxhkdrc
    - user: {{ salt["environ.get"]("USER") }}
    - force: True
