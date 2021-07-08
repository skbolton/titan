include:
  - go

tmux:
  pkg.installed

tmux-config:
  file.managed:
    - name: /home/orlando/.config/tmux/tmux.conf
    - source: salt://tmux/tmux.conf
    - user: orlando
    - makedirs: True

embark-tmux:
  file.managed:
    - name: /home/orlando/.config/tmux/embark.tmux
    - source: salt://tmux/embark.tmux
    - user: orlando
    - makedirs: True

gruvbox-light-tmux:
  file.managed:
    - name: /home/orlando/.config/tmux/gruvbox-light.tmux
    - source: salt://tmux/gruvbox-light.tmux
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
  file.recurse:
    - name: /home/orlando/.config/smug
    - source: salt://tmux/smug/
    - user: orlando
    - makedirs: True
    - force: True

tmux-launcher:
  file.managed:
    - name: /home/orlando/.local/bin/rally.sh
    - source: salt://tmux/rally.sh
    - mode: keep
    - user: orlando
    - force: True
