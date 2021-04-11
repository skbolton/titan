# Yubikey and GPG configuration

yubikey-manager:
  cmd.run:
    - name: paru -S yubikey-manager --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi yubikey-manager

pcscd:
  service.running:
    - enable: True

gpg-agent-config:
  file.symlink:
    - name: /home/orlando/.config/gnupg/gpg-agent.conf
    - target: /home/orlando/titan/gpg/gpg-agent.conf
    - user: orlando
    - makedirs: True

gpg-config:
  file.symlink:
    - name: /home/orlando/.config/gnupg/gpg.conf
    - target: /home/orlando/titan/gpg/gpg.conf
    - user: orlando
    - makedirs: True
