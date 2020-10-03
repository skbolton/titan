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

has-two-monitors-script:
  file.managed:
    - name: {{ salt["environ.get"]("HOME")}}/.local/bin/has-two-monitors
    - user: {{ salt["environ.get"]("USER") }}
    - contents: |
        secondary_monitor=$(xrandr --query | grep 'DisplayPort-1')
        if [[ $secondary_monitor = *connected* ]]; then
          exit 0
        else
          exit 1
        fi

second-monitor-script:
  file.managed:
    - name: {{ salt["environ.get"]("HOME")}}/.local/bin/setup-second-monitor
    - user: {{ salt["environ.get"]("USER") }}
    - contents: |
        # This is for setting up multi monitors in bspwm if they exist
        has-two-monitors && \
        xrandr --output DisplayPort-0 --primary --mode 5120x2160 --rotate normal \
        --output DisplayPort-1 --mode 1920x1080 --rotate normal --above DisplayPort-0 \

sxhkd:
  pkg.installed

sxhkd-config-directory:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/.config/sxhkd
    - user: {{ salt["environ.get"]("USER") }}

sxhkd-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/sxhkd/sxhkdrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/bspwm/sxhkdrc
    - user: {{ salt["environ.get"]("USER") }}
    - force: True
