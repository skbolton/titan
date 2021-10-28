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

zsh-syntax-highlighting:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: /home/orlando/.oh-my-zsh/plugins/zsh-syntax-highlighting
    - user: orlando
    - require:
      - git: oh-my-zsh

zsh-autosuggestions:
  git.cloned:
    - name: https://github.com/zsh-users/zsh-autosuggestions
    - target: /home/orlando/.oh-my-zsh/plugins/zsh-autosuggestions
    - user: orlando
    - require:
      - git: oh-my-zsh

zshenv:
  file.managed:
    - name: /home/orlando/.config/zsh/.zshenv
    - source: salt://zsh/.zshenv
    - makedirs: True
    - user: orlando

link-zsh:
  file.managed:
  - name: /home/orlando/.config/zsh/.zshrc
  - source: salt://zsh/zshrc
  - makedirs: True
  - user: orlando

