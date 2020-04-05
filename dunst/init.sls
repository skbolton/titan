dunst:
  pkg.installed

dunst-config-directory:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/.config/dunst
    - user: {{ salt["environ.get"]("USER") }}

dunstrc:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/dunst/dunstrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/dunst/dunstrc
