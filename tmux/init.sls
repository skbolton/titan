include:
  - ruby

tmux:
  pkg.installed

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ salt["environ.get"]("HOME") }}/.tmux/plugins/tpm

tmux-nord:
  git.cloned:
    - name: https://github.com/arcticicestudio/nord-tmux
    - target: {{ salt["environ.get"]("HOME") }}/.tmux/themes/nord-tmux

tmux-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.tmux.conf
    - target: {{ salt["environ.get"]("HOME") }}/titan/tmux/tmux.conf

tmuxinator:
  gem.installed:
    - name: tmuxinator

tmuxinator-configs:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.tmuxinator
    - target: {{ salt["environ.get"]("HOME") }}/titan/tmux/tmuxinator
