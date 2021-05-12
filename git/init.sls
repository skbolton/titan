gitconfig:
  file.managed:
    - name: /home/orlando/.config/git/config
    - source: salt://git/gitconfig
    - user: orlando
    - makedirs: True

gitignore:
  file.managed:
    - name: /home/orlando/.config/gitignore
    - source: salt://git/gitignore
    - user: orlando

git-branches:
  file.managed:
    - name: /home/orlando/.local/bin/git-branches
    - source: salt://git/git-branches
    - mode: keep
    - user: orlando

github-cli:
  cmd.run:
    - name: paru -S github-cli --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi github-cli

