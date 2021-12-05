nnn:
  git.cloned:
    - name: https://github.com/jarun/nnn
    - target: {{ pillar['xdg_data_home'] }}/nnn
    - user: orlando

trash-cli:
  pkg.installed

nnn-config:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/nnn

nnn-build:
  file.absent:
    - name: /home/orlando/.local/bin/nnn
  cmd.run:
    - cwd: {{ pillar['xdg_data_home'] }}/nnn
    - names:
      - make O_NERD=1
      - mv nnn /home/orlando/.local/bin
      - cp -r plugins {{ pillar['xdg_config_home'] }}/nnn

nnn-desktop:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/applications/nnn.desktop
    - source: salt://nnn/nnn.desktop
