kitty:
  pkg.installed:
    - name: kitty

configs:
  file.recurse:
    - name: /home/orlando/.config/kitty
    - source: salt://kitty/kitty
    - user: orlando
