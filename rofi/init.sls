rofi:
  pkg.installed

rofi-config:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/rofi
    - source: salt://rofi/rofi
    - user: orlando
    - force: True

rofi-emoji:
  cmd.run:
    - name: paru -S rofi-emoji --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi rofi-emoji

rofi-calc:
  pkg.installed

