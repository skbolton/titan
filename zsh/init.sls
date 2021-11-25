include:
  - asdf
  - direnv
  - cli-utils

{% set zsh_dir = "/home/orlando/.config/zsh" %}

zsh:
  pkg.installed

starship:
  pkg.installed

purge-oh-my-zsh:
  file.absent:
    - names:
      - /home/orlando/.config/oh-my-zsh
      - /home/orlando/.config/.oh-my-zsh
      - /home/orlando/.oh-my-zsh

zsh-config:
  file.recurse:
    - name: {{ zsh_dir }}
    - source: salt://zsh/zsh
    - user: orlando
    - force: True

histfile:
  file.directory:
    - name: /home/orlando/.local/share/zsh
    - user: orlando

starship-config:
  file.managed:
    - name: /home/orlando/.config/starship.toml
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
