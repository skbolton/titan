config-directory:
  file.directory:
    - name: {{ grains.homedir }}/.config/alacritty

config-file:
  file.symlink:
    - name: {{ grains.homedir }}/.config/alacritty/alacritty.yml
    - target: {{ grains.statesdir }}/alacritty/alacritty.yml
