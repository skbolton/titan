config:
  file.symlink:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - target: {{ grains.statesdir }}/alacritty/alacritty.yml
