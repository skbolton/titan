nnn:
  git.cloned:
    - name: https://github.com/jarun/nnn
    - target: /home/orlando/.local/share/nnn
    - user: orlando

trash-cli:
  pkg.installed

nnn-config:
  file.directory:
    - name: /home/orlando/.config/nnn

nnn-build:
  file.absent:
    - name: /home/orlando/.local/bin/nnn
  cmd.run:
    - cwd: /home/orlando/.local/share/nnn
    - names:
      - make O_NERD=1
      - mv nnn /home/orlando/.local/bin
      - cp -r plugins /home/orlando/.config/nnn

nnn-desktop:
  file.managed:
    - name: /home/orlando/.local/share/applications/nnn.desktop
    - source: salt://nnn/nnn.desktop
