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
      - /home/orlando/.oh-my-zsh

zsh-env:
  file.managed:
    - name: /home/orlando/.zshenv
    - source: salt://zsh/.zshenv

zsh-config:
  file.recurse:
    - name: {{ zsh_dir }}
    - source: salt://zsh/zsh
    - user: orlando
    - force: True

histfile:
  file.directory:
    - name: {{ pillar['xdg_data_home'] }}/zsh
    - user: orlando

starship-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/starship.toml
    - source: salt://zsh/starship.toml
    - makedirs: True
    - user: orlando

zsh-syntax-highlighting:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: {{ zsh_dir }}/plugins/zsh-syntax-highlighting
    - user: orlando

zsh-autosuggestions:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-autosuggestions
    - target: {{ zsh_dir }}/plugins/zsh-autosuggestions
    - user: orlando

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
    - name: /home/orlando/.local/bin/
    - source: salt://zsh/scripts
    - file_mode: keep
    - user: orlando
    - force: True
