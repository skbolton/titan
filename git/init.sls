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
    - mode: keep
    - user: orlando

github-cli:
  pkg.installed:
    - name: github/gh/gh

