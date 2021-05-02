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
  file.symlink:
    - name: /home/orlando/.config/zk
    - target: /home/orlando/titan/zk/zk
    - force: True
    - user: orlando

