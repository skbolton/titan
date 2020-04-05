polybar:
  pkg.installed

polybar-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/polybar
    - target: {{ salt["environ.get"]("HOME") }}/titan/polybar/polybar
