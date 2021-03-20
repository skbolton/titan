dunst:
  pkg.installed

dunst-config-directory:
  file.directory:
    - name: /home/orlando/.config/dunst
    - user: orlando

dunstrc:
  file.symlink:
    - name: /home/orlando/.config/dunst/dunstrc
    - target: /home/orlando/titan/dunst/dunstrc
    - user: orlando
