include:
  - ruby

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

tmuxinator:
  gem.installed:
    - name: tmuxinator

tmuxinator-configs:
  file.symlink:
    - name: /home/orlando/.tmuxinator
    - target: /home/orlando/titan/tmux/tmuxinator
    - user: orlando

tmux-launcher:
  file.symlink:
    - name: /home/orlando/.local/bin/rally.sh
    - target: /home/orlando/titan/tmux/rally.sh
    - user: orlando
    - force: True
  cmd.run:
    - cwd: /home/orlando/.local/bin
    - name: chmod +x ./rally.sh
