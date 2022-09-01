include:
  - asdf
  - direnv
  - cli-utils

{% set zsh_dir = pillar['xdg_config_home'] + "/zsh" %}

zsh:
  pkg.installed

starship:
  pkg.installed

purge-oh-my-zsh:
  file.absent:
    - names:
      - {{ pillar['xdg_config_home'] }}/oh-my-zsh
      - {{ pillar['xdg_config_home'] }}/.oh-my-zsh
      - /home/{{ grains['user'] }}/.oh-my-zsh

# zsh-env:
#   file.managed:
#     - name: /home/{{ grains['user'] }}/.zshenv
#     - source: salt://zsh/.zshenv
#     - user: {{ grains['user'] }}

zsh-config:
  file.recurse:
    - name: {{ zsh_dir }}
    - source: salt://zsh/zsh
    - user: {{ grains['user'] }}
    - force: True

histfile:
  file.directory:
    - name: {{ pillar['xdg_data_home'] }}/zsh
    - user: {{ grains['user'] }}

starship-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/starship.toml
    - source: salt://zsh/starship.toml
    - makedirs: True
    - user: {{ grains['user'] }}

zsh-syntax-highlighting:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: {{ zsh_dir }}/plugins/zsh-syntax-highlighting
    - user: {{ grains['user'] }}

zsh-autosuggestions:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-autosuggestions
    - target: {{ zsh_dir }}/plugins/zsh-autosuggestions
    - user: {{ grains['user'] }}

zsh-vim-mode:
  git.cloned:
    - name: https://github.com/softmoth/zsh-vim-mode
    - target: {{ zsh_dir }}/plugins/zsh-vim-mode

zsh-fzf-tab:
  git.cloned:
    - name: https://github.com/Aloxaf/fzf-tab
    - target: {{ zsh_dir }}/plugins/fzf-tab

shell-scripts:
  file.recurse:
    - name: /home/{{ grains['user'] }}/.local/bin/
    - source: salt://zsh/scripts
    - file_mode: keep
    - user: {{ grains['user'] }}
    - force: True
