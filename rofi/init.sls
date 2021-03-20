rofi:
  pkg.installed

rofi-config:
  file.symlink:
    - name: /home/orlando/.config/rofi
    - target: /home/orlando/titan/rofi/rofi
    - user: orlando
    - force: True

