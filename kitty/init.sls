kitty:
  {% if grains['os'] == 'MacOS' %}
  cmd.run:
    - name: brew cask install kitty
    - unless: brew cask list kitty
  {% else %}
  pkg.installed:
    - name: kitty
    - unless: pacman -Qi kitty
  {% endif %}

configs:
  file.symlink:
    - name: {{grains.homedir}}/.config/kitty
    - target: {{ grains.statesdir }}/kitty/kitty
