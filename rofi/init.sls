rofi:
  pkg.installed

rofi-config:
  file.recurse:
    - name: /home/orlando/.config/rofi
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

