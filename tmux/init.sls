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
  git.cloned:
    - name: https://github.com/ivaaaan/smug.git
    - target: /home/orlando/smug
    - user: orlando
  cmd.run:
    - cwd: /home/orlando/smug
    - name: go install
    - runas: orlando
  file.absent:
    - name: /home/orlando/smug
