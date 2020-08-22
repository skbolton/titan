{% if grains['os'] != 'MacOS' %}
git:
  pkg.installed:
    - name: git
{% endif %}

gitconfig:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.gitconfig
    - target: {{ salt["environ.get"]("HOME") }}/titan/git/gitconfig

gitignore:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.gitignore_global
    - target: {{ salt["environ.get"]("HOME") }}/titan/git/gitignore

git-branches:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.local/bin/git-branches
    - target: {{ salt["environ.get"]("HOME") }}/titan/git/git-branches
    - user: {{ salt["environ.get"]("USER") }}
