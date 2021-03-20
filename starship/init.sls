starship:
  pkg.installed

starship-config:
  file.symlink:
    - name: /home/orlando/.config/starship.toml
    - target: /home/orlando/titan/starship/starship.toml
    - user: orlando
