# We need rust for dijo to work
include:
  - rust
  - snap

dijo:
  cmd.run:
    - name: paru -S dijo --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi dijo

dijo-data:
  file.symlink:
    - name: /home/orlando/.local/share/dijo
    - target: /home/orlando/Documents/Wolf/dijo
    - force: True

dijo-config:
  file.managed:
    - name: /home/orlando/.config/dijo/config.toml
    - makedirs: True
    - contents:
      - "[look]"
      - true_chr = "●"
      - false_chr = "○"
      - future_chr = "◌"
      - "[colors]"
      - reached = "cyan"
      - todo = "magenta"
      - inactive = "#8A889D"

harsh:
  cmd.run:
    - name: snap install harsh

harsh-habits:
  file.symlink:
    - name: /home/orlando/.config/harsh/habits
    - target: /home/orlando/Documents/Delta/habits
    - user: orlando
    - makedirs: True

harsh-log:
  file.symlink:
    - name: /home/orlando/.config/harsh/log
    - target: /home/orlando/Documents/Delta/habits-log
    - user: orlando
    - makedirs: True
