include:
  - go

zk:
  git.latest:
    - name: https://github.com/mickael-menu/zk.git
    - target: /home/orlando/zk
  file.directory:
    - name: /home/orlando/go/bin
  cmd.run:
    - cwd: /home/orlando/zk
    - names:
      - ./go build
      - mv ./zk /home/orlando/go/bin

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

