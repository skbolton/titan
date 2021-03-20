sxhkd:
  pkg.installed

sxhkd-config-directory:
  file.directory:
    - name: /home/orlando/.config/sxhkd
    - user: orlando

sxhkd-config:
  file.symlink:
    - name: /home/orlando/.config/sxhkd/sxhkdrc
    - target: /home/orlando/titan/sxhkd/sxhkdrc
    - user: orlando
    - force: True
