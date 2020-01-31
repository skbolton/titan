starship:
  pkg.installed

starship-config:
  file.symlink:
    - name: ~/.config/starship.toml
    - target: ~/titan/starship/starship.toml
