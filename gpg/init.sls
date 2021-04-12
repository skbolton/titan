# Yubikey and GPG configuration

yubikey-manager:
  cmd.run:
    - name: paru -S yubikey-manager --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi yubikey-manager

pcscd:
  service.running:
    - enable: True

gpg-config-dir:
  file.directory:
    - name: /home/orlando/.config/gnupg/
    - user: orlando
    - dir_mode: 700
    - file_mode: 600

gpg-agent-config:
  file.symlink:
    - name: /home/orlando/.config/gnupg/gpg-agent.conf
    - target: /home/orlando/titan/gpg/gpg-agent.conf
    - user: orlando

gpg-config:
  file.symlink:
    - name: /home/orlando/.config/gnupg/gpg.conf
    - target: /home/orlando/titan/gpg/gpg.conf
    - user: orlando

receive-public-key:
  cmd.run:
    - name: gpg --receive-keys "35BE29E174F8981ECF31D03C60410414D406AF1D"
    - runas: orlando
