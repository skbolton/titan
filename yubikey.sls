yubikey-manager:
  cmd.run:
    - name: paru -S yubikey-manager --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi yubikey-manager

yubikey-touch-detector:
  cmd.run:
    - name: paru -S yubikey-touch-detector --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi yubikey-touch-detector

pcscd:
  service.running:
    - enable: True

