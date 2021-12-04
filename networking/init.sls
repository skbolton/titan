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


