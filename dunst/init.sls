dunst:
  pkg.installed

dunstrc:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/dunst/dunstrc
    - source: salt://dunst/dunstrc
    - template: jinja
    - mode: keep
    - user: {{ grains['user'] }}
    - makedirs: True
