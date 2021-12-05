kitty:
  pkg.installed:
    - name: kitty

configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/kitty
    - source: salt://kitty/kitty
    - user: orlando
