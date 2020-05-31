starship:
  pkg.installed

starship-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/starship.toml
    - target: {{ salt["environ.get"]("HOME") }}/titan/starship/starship.toml
