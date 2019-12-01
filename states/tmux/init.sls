tmux:
  pkg.installed


tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ grains.homedir }}/.tmux/plugins/tpm

tmux-nord:
  git.cloned:
    - name: https://github.com/arcticicestudio/nord-tmux
    - target: {{ grains.homedir }}/.tmux/themes/nord-tmux

tmux-config:
  file.symlink:
    - name: {{ grains.homedir }}/.tmux.conf
    - target: {{ grains.statesdir }}/tmux/tmux.conf

tmuxinator:
  gem.installed:
    - name: tmuxinator

tmuxinator-configs:
  file.symlink:
    - name: {{ grains.homedir }}/.tmuxinator
    - target: {{ grains.statesdir }}/tmux/tmuxinator
