# We need rust for dijo to work
include:
  - lang.rust
  - snap

dijo:
  cmd.run:
    - name: paru -S dijo --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi dijo

dijo-data:
  file.symlink:
    - name: {{ pillar['xdg_data_home'] }}/dijo
    - target: /home/{{ grains['user'] }}/Documents/Delta/Dashboards/trackers/dijo
    - force: True

dijo-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/dijo/config.toml
    - makedirs: True
    - contents:
      - "[look]"
      - true_chr = "\u25a9"
      - false_chr = "\u25a7"
      - future_chr = "\u2027"
      - "[colors]"
      - reached = "cyan"
      - todo = "red"
      - inactive = "#8A889D"

harsh:
  cmd.run:
    - name: paru -S harsh-bin --no-confirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi harsh-bin
