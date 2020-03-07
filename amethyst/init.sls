amethyst-installed:
  cmd.run:
    - name: brew cask install amethyst

config:
  file.symlink:
    - name: {{ salt["environ.get"]("HOME") }}/.amethyst
    - target: {{ salt["environ.get"]("HOME") }}/titan/amethyst/.amethyst
