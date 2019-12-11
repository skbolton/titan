amethyst-installed:
  cmd.run:
    - name: brew cask install amethyst

config:
  file.symlink:
    - name: {{grains.homedir}}/.amethyst
    - target: {{grains.statesdir}}/amethyst/.amethyst
