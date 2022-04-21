bluetooth:
  pkg.installed:
    - name: bluez

bluetooth-service:
  service.running:
    - name: bluetooth
    - enable: True
    - require:
      - pkg: bluetooth

bluetooth-manager:
  pkg.installed:
    - name: blueman
