picom:
  cmd.run:
    - name: paru -S picom-jonaburg-git --skipreview --noconfirm
    - runas: orlando

picom-config:
  file.symlink:
    - name: /home/orlando/.config/picom.conf
    - target: /home/orlando/titan/picom/picom.conf
    - makedirs: True

