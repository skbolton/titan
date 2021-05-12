{% if grains['os'] != 'MacOS' %}
git:
  pkg.installed:
    - name: git
{% endif %}

gitconfig:
  file.managed:
    - name: /home/orlando/.gitconfig
    - source: salt://git/gitconfig
    - user: orlando

gitignore:
  file.managed:
    - name: /home/orlando/.gitignore_global
    - source: salt://git/gitignore
    - user: orlando

git-branches:
  file.managed:
    - name: /home/orlando/.local/bin/git-branches
    - source: salt://git/git-branches
    - user: orlando

github-cli:
  pkg.installed:
  {% if grains['os'] != 'MacOS' %}
    - name: github-cli
  {% else %}
    - name: github/gh/gh
  {% endif %}

