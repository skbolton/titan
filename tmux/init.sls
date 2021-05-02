include:
  - go

tmux:
  pkg.installed

tmux-config:
  file.symlink:
    - name: /home/orlando/.config/tmux/tmux.conf
    - target: /home/orlando/titan/tmux/tmux.conf
    - user: orlando
    - makedirs: True

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: /home/orlando/.config/tmux/plugins/tpm
    - user: orlando

smug:
  git.latest:
    - name: https://github.com/ivaaaan/smug
    - target: /home/orlando/Repos/smug
    - user: orlando
  cmd.run:
    - cwd: /home/orlando/Repos/smug
    - name: go install
    - runas: orlando
    - onchanges:
      - git: smug

smug-config:
  file.symlink:
    - name: /home/orlando/.config/smug
    - target: /home/orlando/titan/tmux/smug
    - user: orlando
    - makedirs: True
    - force: True

tmux-launcher:
  file.symlink:
    - name: /home/orlando/.local/bin/rally.sh
    - target: /home/orlando/titan/tmux/rally.sh
    - user: orlando
    - force: True
  cmd.run:
    - cwd: /home/orlando/.local/bin
    - name: chmod +x ./rally.sh
