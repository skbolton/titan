rofi:
  pkg.installed

rofi-config:
  file.symlink:
    - name: /home/orlando/.config/rofi
    - target: /home/orlando/titan/rofi/rofi
    - user: orlando
    - force: True

rofi-emoji:
  cmd.run:
    - name: paru -S rofi-emoji --noconfirm --skipreview
    - runas: orlando

