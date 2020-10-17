include:
  - asdf
  - direnv

zsh:
  pkg.installed

clear-oh-my-zsh:
  file.absent:
    - name: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh

oh-my-zsh:
  git.cloned:
    - name: https://github.com/robbyrussell/oh-my-zsh.git
    - target: {{ salt["environ.get"]("HOME") }}/.oh-my-zsh
    - user: {{ salt["environ.get"]("USER") }}

create-zsh-folder:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/.config/zsh
    - user: {{ salt["environ.get"]("USER") }}
    - makedirs: True

link-prompt:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/zsh/promptrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/promptrc
    - user: {{ salt["environ.get"]("USER") }}

link-path:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.config/zsh/pathrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/pathrc
    - user: {{ salt["environ.get"]("USER") }}

link-zshenv:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.zshenv
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/.zshenv
    - user: {{ salt["environ.get"]("USER") }}

link-zsh:
  file.symlink:
  - name: {{ salt["environ.get"]("HOME") }}/.config/.zshrc
  - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/zshrc
  - user: {{ salt["environ.get"]("USER") }}

