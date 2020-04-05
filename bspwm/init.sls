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
    - force: True

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
    - force: True
