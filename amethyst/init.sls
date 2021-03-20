amethyst-installed:
  cmd.run:
    - name: brew cask install amethyst

config:
  file.symlink:
    - name: /home/orlando/.amethyst
    - target: /home/orlando/titan/amethyst/.amethyst
