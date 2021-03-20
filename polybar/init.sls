polybar:
  pkg.installed

polybar-config:
  file.symlink:
    - name: /home/orlando/.config/polybar
    - target: /home/orlando/titan/polybar/polybar
    - user: orlando
