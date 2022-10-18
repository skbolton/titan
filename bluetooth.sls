bluetooth:
  pkg.installed:
    - name: bluez

bluetoothctl:
  pkg.installed:
    - name: bluez-utils
    - require:
      - pkg: bluetooth

bluetooth-service:
  service.running:
    - name: bluetooth
    - enable: True
    - require:
      - pkg: bluetooth

bluetooth-manager:
  pkg.installed:
    - name: blueman
