include:
  - fonts

{% from "polybar/map.jinja" import polybar_configs with context %}

polybar:
  cmd.run:
    - name: paru -S polybar --noconfirm --skipreview
    - unless: paru -Qi polybar
    - runas: {{ grains['user'] }}

polybar-bars:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/polybar/config.ini
    - source: salt://polybar/{{ polybar_configs.config }}
    - mode: keep
    - user: {{ grains['user'] }}

polybar-launcher:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/polybar/launch.sh
    - source: salt://polybar/{{ polybar_configs.launcher }}
    - mode: keep
    - user: {{ grains['user'] }}

polybar-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/polybar
    - source: salt://polybar/polybar
    - file_mode: keep
    - user: {{ grains['user'] }}

