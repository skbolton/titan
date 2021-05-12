include:
  - fonts

polybar:
  cmd.run:
    - name: paru -S polybar --noconfirm --skipreview
    - unless: paru -Qi polybar
    - runas: orlando

polybar-config:
  file.recurse:
    - name: /home/orlando/.config/polybar
    - source: salt://polybar/polybar
    - file_mode: keep
    - user: orlando

