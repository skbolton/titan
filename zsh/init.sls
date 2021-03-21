include:
  - asdf
  - direnv
  - cli-utils

zsh:
  pkg.installed

starship:
  pkg.installed

starship-config:
  file.symlink:
    - name: /home/orlando/.config/starship.toml
    - target: /home/orlando/titan/zsh/starship.toml
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
  file.symlink:
    - name: /home/orlando/.config/zsh/promptrc
    - target: /home/orlando/titan/zsh/promptrc
    - makedirs: True
    - user: orlando

link-path:
  file.symlink:
    - name: /home/orlando/.config/zsh/pathrc
    - target: /home/orlando/titan/zsh/pathrc
    - makedirs: True
    - user: orlando

link-zshenv:
  file.symlink:
    - name: /home/orlando/.zshenv
    - target: /home/orlando/titan/zsh/.zshenv
    - makedirs: True
    - user: orlando

link-zsh:
  file.symlink:
  - name: /home/orlando/.config/zsh/.zshrc
  - target: /home/orlando/titan/zsh/zshrc
  - makedirs: True
  - user: orlando

