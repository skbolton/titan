include:
  - systemd # Needed so that spotify user service has proper env vars

playerctl: pkg.installed

spotifyd: 
  cmd.run:
    - name: paru -S spotifyd-full-git --noconfirm --skipreview
    - unless: paru -Qi spotifyd-full-git
    - runas: {{ grains['user'] }}

spotifyd-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/spotifyd/spotifyd.conf
    - template: jinja
    - source: salt://music/spotifyd.conf
    - user: {{ grains['user'] }}
    - makedirs: True
    - force: True

spotify-tui:
  cmd.run:
    - name: paru -S spotify-tui --noconfirm --skipreview
    - unless: paru -Qi spotify-tui
    - runas: {{ grains['user'] }}
    - require:
      - cmd: spotifyd
