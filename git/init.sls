gitconfig:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/git/config
    - source: salt://git/gitconfig
    - user: orlando
    - makedirs: True

gitignore:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/git/gitignore
    - source: salt://git/gitignore
    - user: orlando

git-branches:
  file.managed:
    - name: /home/orlando/.local/bin/git-branches
    - source: salt://git/git-branches
    - mode: keep
    - user: orlando

git-default-branch:
  file.managed:
    - name: /home/orlando/.local/bin/git-default-branch
    - source: salt://git/git-default-branch
    - mode: keep
    - user: orlando


github-cli:
  cmd.run:
    - name: paru -S github-cli --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi github-cli

