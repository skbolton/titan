zsh:
  pkg.installed

clear-oh-my-zsh:
  file.absent:
    - name: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh

clear-zsh:
  file.absent:
    - name: {{ salt["environ.get"]("HOME") }}/.zshrc

oh-my-zsh:
  git.cloned:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh

create-zsh-folder:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/zsh
    - user: {{ salt["environ.get"]("USER") }}

link-prompt:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/zsh/promptrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/promptrc

link-path:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/zsh/pathrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/pathrc

link-zsh:
  file.symlink:
  - name: {{ salt["environ.get"]("HOME") }}/.zshrc
  - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/zshrc

spaceship-prompt-oh-my-zsh:
  git.cloned:
    - name : https://github.com/denysdovhan/spaceship-prompt.git
    - target: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh/custom/themes/spaceship-prompt

  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh/custom/themes/spaceship.zsh-theme
    - target: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme
    - force: True
