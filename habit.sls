# We need rust for dijo to work
include:
  - rust
  - snap

dijo:
  cmd.run:
    - name: paru -S dijo --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi dijo

dijo-data:
  file.symlink:
    - name: {{ pillar['xdg_data_home'] }}/dijo
    - target: /home/{{ grains['user'] }}/Documents/Delta/habits
    - force: True

dijo-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/dijo/config.toml
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

