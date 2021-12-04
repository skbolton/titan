iwd: pkg.installed

iwd-started:
  service.running:
    - enable: True
    - name: iwd
    - require:
      - pkg: iwd

# make sure another dhcpc client is not running
# NetworkManager will handle this
dhcpcd:
  service.dead:
    - name: dhcpcd
    # Make sure it also not enabled on next boot
    - enable: False

systemd-resolved:
  service.running:
    - enable: True
    - name: systemd-resolved
  file.symlink:
    - name: /etc/resolv.conf
    - target: /run/systemd/resolve/stub-resolv.conf
    - force: True

networkmanager: 
  pkg.installed:
    - require:
      - pkg: iwd

network-manager-applet:
  pkg.installed:
    - require:
      - pkg: iwd

networkmanager-started:
  service.running:
    - enable: True
    - name: NetworkManager
    - require:
      - pkg: networkmanager


networkmanager-configs:
  file.recurse:
    - name: /etc/NetworkManager/conf.d
    - source: salt://networking/NetworkManager
    - makedirs: True
    - force: True


