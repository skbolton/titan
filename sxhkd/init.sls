sxhkd:
  pkg.installed

sxhkd-config:
  file.managed:
    - name: /home/orlando/.config/sxhkd/sxhkdrc
    - source: salt://sxhkd/sxhkdrc
    - user: orlando
    - force: True
    - makedirs: True
