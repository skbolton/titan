include:
  - asdf
  - direnv
  - cli-utils

zsh:
  pkg.installed

starship:
  pkg.installed

starship-config:
  file.managed:
    - name: /home/orlando/.config/starship.toml
    - source: salt://zsh/starship.toml
    - makedirs: True
    - user: orlando

clear-oh-my-zsh:
  file.absent:
    - name: /home/orlando/.oh-my-zsh

oh-my-zsh:
  git.cloned:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/orlando/.oh-my-zsh
    - user: orlando

link-prompt:
  file.managed:
    - name: /home/orlando/.config/zsh/promptrc
    - source: salt://zsh/promptrc
    - makedirs: True
    - user: orlando

link-path:
  file.managed:
    - name: /home/orlando/.config/zsh/pathrc
    - source: salt://zsh/pathrc
    - makedirs: True
    - user: orlando

zshenv:
  file.managed:
    - name: /home/orlando/.zshenv
    - source: salt://zsh/.zshenv
    - makedirs: True
    - user: orlando

link-zsh:
  file.managed:
  - name: /home/orlando/.config/zsh/.zshrc
  - source: salt://zsh/zshrc
  - makedirs: True
  - user: orlando

