{% if grains['os'] != 'MacOS' %}
git:
  pkg.installed:
    - name: git
{% endif %}

gitconfig:
  file.symlink:
    - name: {{ grains.homedir }}/.gitconfig
    - target: {{ grains.statesdir }}/git/gitconfig

gitignore:
  file.symlink:
    - name: {{ grains.homedir }}/.gitignore_global
    - target: {{ grains.statesdir }}/git/gitignore
