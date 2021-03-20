{% if grains['os'] != 'MacOS' %}
git:
  pkg.installed:
    - name: git
{% endif %}

gitconfig:
  file.symlink:
    - name: /home/orlando/.gitconfig
    - target: /home/orlando/titan/git/gitconfig
    - user: orlando

gitignore:
  file.symlink:
    - name: /home/orlando/.gitignore_global
    - target: /home/orlando/titan/git/gitignore
    - user: orlando

git-branches:
  file.symlink:
    - name: /home/orlando/.local/bin/git-branches
    - target: /home/orlando/titan/git/git-branches
    - user: orlando

github-cli:
  pkg.installed:
  {% if grains['os'] != 'MacOS' %}
    - name: github-cli
  {% else %}
    - name: github/gh/gh
  {% endif %}

