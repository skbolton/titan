include:
  - ruby

tmux:
  pkg.installed

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ salt["environ.get"]("HOME") }}/.tmux/plugins/tpm
    - user: {{ salt["environ.get"]("USER") }}

tmux-nord:
  git.cloned:
    - name: https://github.com/arcticicestudio/nord-tmux
    - target: {{ salt["environ.get"]("HOME") }}/.tmux/themes/nord-tmux
    - user: {{ salt["environ.get"]("USER") }}

tmux-config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.tmux.conf
    - target: {{ salt["environ.get"]("HOME") }}/titan/tmux/tmux.conf
    - user: {{ salt["environ.get"]("USER") }}

tmuxinator:
  gem.installed:
    - name: tmuxinator

tmuxinator-configs:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.tmuxinator
    - target: {{ salt["environ.get"]("HOME") }}/titan/tmux/tmuxinator
    - user: {{ salt["environ.get"]("USER") }}
