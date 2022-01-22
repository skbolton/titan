sxhkd:
  pkg.installed

sxhkd-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/sxhkd/sxhkdrc
    - source: salt://sxhkd/sxhkdrc
    - user: {{ grains['user'] }}
    - force: True
    - makedirs: True
