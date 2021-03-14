sxhkd:
  pkg.installed

sxhkd-config-directory:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/.config/sxhkd
    - user: {{ salt["environ.get"]("USER") }}

sxhkd-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/sxhkd/sxhkdrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/sxhkd/sxhkdrc
    - user: {{ salt["environ.get"]("USER") }}
    - force: True
