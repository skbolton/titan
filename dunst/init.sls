dunst:
  pkg.installed

dunstrc:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/dunst/dunstrc
    - source: salt://dunst/dunstrc
    - mode: keep
    - user: orlando
    - makedirs: True
