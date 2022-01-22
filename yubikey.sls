yubikey-manager:
  cmd.run:
    - name: paru -S yubikey-manager --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi yubikey-manager

pcscd:
  service.running:
    - enable: True

