include:
  - go
  - cli-utils

zk:
  cmd.run:
    - name: paru -S zk --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi zk

zk-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/zk/config.toml
    - source: salt://zk/config.toml
    - makedirs: True
    - force: True
    - user: orlando

delta-emoji-picker:
  file.managed:
    - name: /home/orlando/.local/bin/delta-emoji-picker
    - source: salt://zk/delta-emoji-picker
    - mode: keep
    - user: orlando

generate-journal:
  file.managed:
    - name: /home/orlando/.local/bin/generate-journal.sh
    - source: salt://zk/generate-journal.sh
    - mode: keep
    - user: orlando
