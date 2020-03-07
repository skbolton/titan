ranger:
  pkg.installed:
    - name: ranger

ranger-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/ranger
    - target: {{ salt["environ.get"]("HOME") }}/titan/ranger/ranger
