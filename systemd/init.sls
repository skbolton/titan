systemd-user-configs:
  file.managed:
    - name: /home/orlando/.config/environment.d/env.conf
    - source: salt://systemd/env.conf
    - user: orlando
    - makedirs: True
