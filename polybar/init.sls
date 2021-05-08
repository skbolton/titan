include:
  - fonts

polybar:
  cmd.run:
    - name: paru -S polybar --noconfirm --skipreview
    - unless: paru -Qi polybar
    - runas: orlando

polybar-config:
  file.symlink:
    - name: /home/orlando/.config/polybar
    - target: /home/orlando/titan/polybar/polybar
    - user: orlando
