dunst:
  pkg.installed

dunstrc:
  file.managed:
    - name: /home/orlando/.config/dunst/dunstrc
    - source: salt://dunst/dunstrc
    - mode: keep
    - user: orlando
    - makedirs: True
