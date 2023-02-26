kitty:
  pkg.installed:
    - name: kitty

kitty-icon:
  file.replace:
    - name: /usr/share/applications/kitty.desktop
    - pattern: Icon=.*
    - repl: Icon=/srv/titan/kitty/kitty-dark.png

kitty-client-icon:
  file.managed:
    - name: /usr/lib/kitty/logo/kitty-128.png
    - source: salt://kitty/kitty-light.png

workitty-desktop:
  file.managed:
    - name: /usr/share/applications/kitty-work.desktop
    - source: salt://kitty/kitty-work.desktop

configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/kitty
    - source: salt://kitty/kitty
    - user: {{ grains['user'] }}
