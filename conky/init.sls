conky: pkg.installed

conkies:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/conky
    - file_mode: keep
    - source: salt://conky/conky
    - user: {{ grains['user'] }}
    - force: True
