gitconfig:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/git/config
    - source: salt://git/gitconfig
    - user: {{ grains['user'] }}
    - makedirs: True

gitignore:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/git/gitignore
    - source: salt://git/gitignore
    - user: {{ grains['user'] }}

commit-template:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/git/commit-template
    - source: salt://git/commit-template
    - user: {{ grains['user'] }}

git-branches:
  file.managed:
    - name: /home/{{ grains['user'] }}/.local/bin/git-branches
    - source: salt://git/git-branches
    - mode: keep
    - user: {{ grains['user'] }}

git-default-branch:
  file.managed:
    - name: /home/{{ grains['user'] }}/.local/bin/git-default-branch
    - source: salt://git/git-default-branch
    - mode: keep
    - user: {{ grains['user'] }}

github-cli: pkg.installed

github-cli-dash:
  cmd.run:
    - name: gh extension install dlvhdr/gh-dash
    - runas: {{ grains['user'] }}
    - unless: gh dash --help
    - require:
      - pkg: github-cli
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/gh-dash/config.yml
    - source: salt://git/gh-dash.config.yml
    - makedirs: True
    - user: {{ grains['user'] }}

