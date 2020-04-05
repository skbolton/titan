rofi:
  pkg.installed

rofi-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/rofi
    - target: {{ salt["environ.get"]("HOME") }}/titan/rofi/rofi
    - force: True

