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
      - make O_NERD=1 O_NAMEFIRST=1
      - mv nnn /home/{{ grains['user'] }}/.local/bin
      - cp -r plugins {{ pillar['xdg_config_home'] }}/nnn
    - runas: {{ grains['user'] }}

nnn-desktop:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/applications/nnn.desktop
    - template: jinja
    - source: salt://nnn/nnn.desktop
    - makedirs: True
