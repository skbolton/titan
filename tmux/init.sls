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
    - user: {{ grains['user'] }}
    - makedirs: True

embark-tmux:
  file.managed:
    - name: {{ tmux_dir }}/embark.tmux
    - source: salt://tmux/embark.tmux
    - user: {{ grains['user'] }}
    - makedirs: True

gruvbox-light-tmux:
  file.managed:
    - name: {{ tmux_dir }}/gruvbox-light.tmux
    - source: salt://tmux/gruvbox-light.tmux
    - user: {{ grains['user'] }}
    - makedirs: True

neoline:
  file.managed:
    - name: {{ tmux_dir }}/neoline.tmux
    - source: salt://tmux/neoline.tmux
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
  cmd.run:
    - name: gem install tmuxinator
    - runas: {{ grains['user'] }}

tmuxinator-configs:
  file.recurse:
    - name: {{ pillar['xdg_config_home'] }}/tmuxinator
    - source: salt://tmux/tmuxinator/
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
