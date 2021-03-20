include:
  - ruby

tmux:
  pkg.installed

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: /home/orlando/.tmux/plugins/tpm
    - user: orlando

tmux-nord:
  git.cloned:
    - name: https://github.com/arcticicestudio/nord-tmux
    - target: /home/orlando/.tmux/themes/nord-tmux
    - user: orlando

tmux-config:
  file.symlink:
    - name: /home/orlando/.tmux.conf
    - target: /home/orlando/titan/tmux/tmux.conf
    - user: orlando

tmuxinator:
  gem.installed:
    - name: tmuxinator

tmuxinator-configs:
  file.symlink:
    - name: /home/orlando/.tmuxinator
    - target: /home/orlando/titan/tmux/tmuxinator
    - user: orlando
