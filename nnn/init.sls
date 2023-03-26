nnn:
  git.cloned:
    - name: https://github.com/jarun/nnn
    - target: {{ pillar['xdg_data_home'] }}/nnn
    - user: {{ grains['user'] }}

trash-cli:
  pkg.installed

nnn-config:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/nnn
    - user: {{ grains['user'] }}

nnn-build:
  file.absent:
    - name: /home/{{ grains['user'] }}/.local/bin/nnn
  cmd.run:
    - cwd: {{ pillar['xdg_data_home'] }}/nnn
    - names:
      - make O_NAMEFIRST=1 O_EMOJI=1
      - mv nnn /home/{{ grains['user'] }}/.local/bin
      - cp -r plugins {{ pillar['xdg_config_home'] }}/nnn
    - runas: {{ grains['user'] }}

tmsu:
  cmd.run:
    - name: paru -S tmsu-bin --no-confirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi tmsu-bin

tmsu-tag-nnn-plugin:
  file.managed:
    - name: {{ pillar['xdg_config_home']}}/nnn/plugins/tmsu-tag.sh
    - source: salt://nnn/tmsu-tag.sh
    - mode: keep
    - user: {{ grains['user'] }}

nnn-desktop:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/applications/nnn.desktop
    - template: jinja
    - source: salt://nnn/nnn.desktop
    - makedirs: True
