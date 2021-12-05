# gives the lsusb utility which is helpful in debugging usb scanners
libusb: pkg.installed

sane-airscan: pkg.installed

ipp-usb: pkg.installed

ipp-usb-running:
  service.running:
    - name: ipp-usb
    - enable: True
    - require:
      - pkg: ipp-usb

# the driver for my scanner
brscan5:
  cmd.run:
    - name: paru -S brscan5 --noconfirm --skipreview
    - unless: paru -Qi brscan5

brother-scanner-udev-rule:
  file.managed:
    - name: /etc/udev/rules.d/49-sane-missing-scanner.rules
    - source: salt://scanner/brother-scanner.rules

# a gui program for scanning docs
simple-scan: pkg.installed

