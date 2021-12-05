include:
  - systemd # Needed so that spotify user service has proper env vars

playerctl: pkg.installed

spotifyd: 
  cmd.run:
    - name: paru -S spotifyd-full-git --noconfirm --skipreview
    - unless: paru -Qi spotifyd-full-git
    - runas: orlando

spotifyd-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/spotifyd/spotifyd.conf
    - source: salt://music/spotifyd.conf
    - user: orlando
    - makedirs: True
    - force: True

spotify-tui:
  cmd.run:
    - name: paru -S spotify-tui --noconfirm --skipreview
    - unless: paru -Qi spotify-tui
    - runas: orlando
    - require:
      - cmd: spotifyd
