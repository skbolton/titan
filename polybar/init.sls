include:
  - fonts

{% from "polybar/map.jinja" import polybar_configs with context %}

polybar:
  cmd.run:
    - name: paru -S polybar --noconfirm --skipreview
    - unless: paru -Qi polybar
    - runas: orlando

polybar-bars:
  file.managed:
    - name: /home/orlando/.config/polybar/config.ini
    - source: salt://polybar/{{ polybar_configs.config }}
    - mode: keep
    - user: orlando

polybar-launcher:
  file.managed:
    - name: /home/orlando/.config/polybar/launch.sh
    - source: salt://polybar/{{ polybar_configs.launcher }}
    - mode: keep
    - user: orlando

polybar-config:
  file.recurse:
    - name: /home/orlando/.config/polybar
    - source: salt://polybar/polybar
    - file_mode: keep
    - user: orlando

