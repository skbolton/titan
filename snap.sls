snap:
  cmd.run:
    - name: paru -S snapd --noconfirm --skipreview
    - unless: paru -Qi snapd
    - runas: {{ grains['user'] }}

snap-classic:
  file.symlink:
    - name: /snap
    - target: /var/lib/snapd/snap

snap-service:
  service.running:
    - enable: True
    - name: snapd.socket
  require:
    - cmd: snap
