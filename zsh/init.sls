include:
  - asdf
  - direnv
  - cli-utils

zsh:
  pkg.installed

clear-oh-my-zsh:
  file.absent:
    - name: /home/orlando/.oh-my-zsh

oh-my-zsh:
  git.cloned:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: /home/orlando/.oh-my-zsh
    - user: orlando

create-zsh-folder:
  file.directory:
    - name: /home/orlando/.config/zsh
    - user: orlando
    - makedirs: True

link-prompt:
  file.symlink:
    - name: /home/orlando/.config/zsh/promptrc
    - target: /home/orlando/titan/zsh/promptrc
    - user: orlando

link-path:
  file.symlink:
    - name: /home/orlando/.config/zsh/pathrc
    - target: /home/orlando/titan/zsh/pathrc
    - user: orlando

link-zshenv:
  file.symlink:
    - name: /home/orlando/.zshenv
    - target: /home/orlando/titan/zsh/.zshenv
    - user: orlando

link-zsh:
  file.symlink:
  - name: /home/orlando/.config/zsh/.zshrc
  - target: /home/orlando/titan/zsh/zshrc
  - user: orlando

