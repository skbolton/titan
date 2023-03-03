include:
  - lang.go
  - lang.ruby

{% set tmux_dir = pillar['xdg_config_home'] + '/tmux' %}

tmux:
  pkg.installed

tmux-config:
  file.recurse:
    - name: {{ tmux_dir }}/
    - source: salt://tmux/tmux/
    - force: True
    - user: {{ grains['user'] }}
    - makedirs: True

tmux-plugin-manager:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: {{ tmux_dir }}/plugins/tpm
    - user: {{ grains['user'] }}

# For some reason I have to manually install
# TPM won't install this
tmux-fuzzback:
  git.cloned:
    - name: https://github.com/roosta/tmux-fuzzback
    - target: {{ tmux_dir }}/plugins/tmux-fuzzback
    - user: {{ grains['user'] }}

tmuxinator:
  gem.installed:
    - name: tmuxinator
    - user: {{ grains['user'] }}

tmuxinator-configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/tmuxinator
    - source: salt://tmux/tmuxinator/
    - user: {{ grains['user'] }}
    - makedirs: True
    - force: True

smug-configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home']}}/smug
    - source: salt://tmux/smug
    - user: {{ grains['user'] }}
    - makedirs: True
    - force: True

tmux-launcher:
  file.managed:
    - name: /home/{{ grains['user'] }}/.local/bin/rally.sh
    - source: salt://tmux/rally.sh
    - mode: keep
    - user: {{ grains['user'] }}
    - force: True

clickup:
  file.managed:
    - name: /home/{{ grains['user'] }}/.local/bin/clickup.sh
    - source: salt://tmux/clickup.sh
    - mode: keep
    - user: {{ grains['user'] }}
    - force: True
