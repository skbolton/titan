kitty:
  pkg.installed:
    - name: kitty

kitty-icon:
  file.replace:
    - name: /usr/share/applications/kitty.desktop
    - pattern: Icon=.*
    - repl: Icon=/srv/titan/kitty/kitty-dark.png

configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/kitty
    - source: salt://kitty/kitty
    - user: {{ grains['user'] }}
