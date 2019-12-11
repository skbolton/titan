ranger:
  pkg.installed:
    - name: ranger

ranger-config:
  file.symlink:
    - name: {{ grains.homedir }}/.config/ranger
    - target: {{ grains.statesdir }}/ranger/ranger
