include:
  - go
  - cli-utils

zk:
  git.latest:
    - name: https://github.com/mickael-menu/zk.git
    - rev: v0.6.0
    - target: /home/orlando/.local/share/zk
    - user: orlando
  cmd.run:
    - cwd: /home/orlando/.local/share/zk
    - names:
      - make
      - mv -f ./zk /home/orlando/.local/share/go/bin

zk-config:
  file.managed:
    - name: /home/orlando/.config/zk/config.toml
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

