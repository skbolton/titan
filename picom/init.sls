picom:
  cmd.run:
    - name: paru -S picom-jonaburg-git --skipreview --noconfirm
    - runas: orlando
    - unless: paru -Qi picom-jonaburg-git

picom-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/picom.conf
    - source: salt://picom/picom.conf
    - makedirs: True

