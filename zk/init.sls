include:
  - go
  - cli-utils

zk:
  git.latest:
    - name: https://github.com/mickael-menu/zk.git
    - target: {{ pillar['xdg_data_home'] }}/zk
    - user: orlando
  cmd.run:
    - cwd: {{ pillar['xdg_data_home'] }}/zk
    - names:
      - make
      - mv -f ./zk {{ pillar['go_path'] }}

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
