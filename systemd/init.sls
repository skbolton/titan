systemd-user-configs:
  file.managed:
    - template: jinja
    - name: {{ pillar['xdg_config_home'] }}/environment.d/env.conf
    - source: salt://systemd/env.conf
    - user: {{ grains['user'] }}
    - makedirs: True
