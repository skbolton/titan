nnn:
  git.cloned:
    - name: https://github.com/jarun/nnn
    - target: /home/orlando/.local/share/nnn
    - user: orlando

nnn-build:
  file.absent:
    - name: /home/orlando/.local/bin/nnn
  cmd.run:
    - cwd: /home/orlando/.local/share/nnn
    - names:
      - make O_NERD=1
      - mv nnn /home/orlando/.local/bin
