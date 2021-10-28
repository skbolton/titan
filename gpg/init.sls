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
    - name: /home/orlando/.config/gpg
    - user: orlando
    - dir_mode: 700
    - file_mode: 600

gpg-agent-config:
  file.managed:
    - name: /home/orlando/.config/gpg/gpg-agent.conf
    - source: salt://gpg/gpg-agent.conf
    - user: orlando

gpg-config:
  file.managed:
    - name: /home/orlando/.config/gpg/gpg.conf
    - source: salt://gpg/gpg.conf
    - user: orlando

my-gpg-key:
  gpg.present:
    - keys: 35BE29E174F8981ECF31D03C60410414D406AF1D
    - user: orlando
    - gnupghome: /home/orlando/.config/gpg
    - trust: "ultimately"

