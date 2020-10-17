include:
  - asdf
  - direnv

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
    - user: {{ salt["environ.get"]("USER") }}

create-zsh-folder:
  file.directory:
    - name: {{ salt["environ.get"]("HOME") }}/zsh
    - user: {{ salt["environ.get"]("USER") }}
    - user: {{ salt["environ.get"]("USER") }}

link-prompt:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/zsh/promptrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/promptrc
    - user: {{ salt["environ.get"]("USER") }}

link-path:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/zsh/pathrc
    - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/pathrc
    - user: {{ salt["environ.get"]("USER") }}

link-zsh:
  file.symlink:
  - name: {{ salt["environ.get"]("HOME") }}/.zshrc
  - target: {{ salt["environ.get"]("HOME") }}/titan/zsh/zshrc
    - user: {{ salt["environ.get"]("USER") }}

