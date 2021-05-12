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
  file.recurse:
    - name: /home/orlando/.config/kitty
    - source: salt://kitty/kitty
    - user: orlando
