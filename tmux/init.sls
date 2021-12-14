include:
  - go
  - ruby

{% set tmux_dir = pillar['xdg_config_home'] + '/tmux' %}

tmux:
  pkg.installed

tmux-config:
  file.managed:
    - name: {{ tmux_dir }}/tmux.conf
    - source: salt://tmux/tmux.conf
    - user: orlando
    - makedirs: True

embark-tmux:
  file.managed:
    - name: {{ tmux_dir }}/embark.tmux
    - source: salt://tmux/embark.tmux
    - user: orlando
    - makedirs: True

gruvbox-light-tmux:
  file.managed:
    - name: {{ tmux_dir }}/gruvbox-light.tmux
    - source: salt://tmux/gruvbox-light.tmux
    - user: orlando
    - makedirs: True

neoline:
  file.managed:
    - name: {{ tmux_dir }}/neoline.tmux
    - source: salt://tmux/neoline.tmux
    - user: orlando
    - makedirs: True

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ tmux_dir }}/plugins/tpm
    - user: orlando

# For some reason I have to manually install
# TPM won't install this
tmux-fuzzback:
  git.cloned:
    - name: https://github.com/roosta/tmux-fuzzback
    - target: {{ tmux_dir }}/plugins/tmux-fuzzback
    - user: orlando

tmuxinator:
  cmd.run:
    - name: gem install tmuxinator
    - runas: orlando

tmuxinator-configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/tmuxinator
    - source: salt://tmux/tmuxinator/
    - user: orlando
    - makedirs: True
    - force: True

# smug:
#   git.latest:
#     - name: https://github.com/ivaaaan/smug
#     - target: /home/orlando/Repos/smug
#     - user: orlando
#   cmd.run:
#     - cwd: /home/orlando/Repos/smug
#     - name: go install
#     - runas: orlando
#     - onchanges:
#       - git: smug

# smug-config:
#   file.recurse:
#     - name: {{ pillar['xdg_config_home'] }}/smug
#     - source: salt://tmux/smug/
#     - user: orlando
#     - makedirs: True
#     - force: True

tmux-launcher:
  file.managed:
    - name: /home/orlando/.local/bin/rally.sh
    - source: salt://tmux/rally.sh
    - mode: keep
    - user: orlando
    - force: True

clickup:
  file.managed:
    - name: /home/orlando/.local/bin/clickup.sh
    - source: salt://tmux/clickup.sh
    - mode: keep
    - user: orlando
    - force: True
