# We need rust for dijo to work
include:
  - rust

dijo-config:
  file.symlink:
    {% if grains['os'] == 'MacOs' %}
    - name: {{ salt["environ.get"]("HOME") }}/Library/Application\ Support/rs.nerdypepper.dijo/
    {% else %}
    - name: {{ salt["environ.get"]("HOME") }}/.local/share/dijo
    {% endif %}
    - target: {{ salt["environ.get"]("HOME") }}/cloud/Habits/current-year/
    - force: True

