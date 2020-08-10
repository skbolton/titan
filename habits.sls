# We need rust for dijo to work
include:
  - rust

dijo-data:
  file.symlink:
    {% if grains['os'] == 'MacOS' %}
    - name: {{ salt["environ.get"]("HOME") }}/Library/Application\ Support/rs.nerdypepper.dijo/
    {% else %}
    - name: {{ salt["environ.get"]("HOME") }}/.local/share/dijo
    {% endif %}
    - target: {{ salt["environ.get"]("HOME") }}/cloud/Habits/current-year/
    - force: True

dijo-config:
  file.managed:
    - name: {{ salt["environ.get"]("HOME") }}/.config/dijo/config.toml
    - contents:
      - "[look]"
      - true_chr = "●"
      - false_chr = "○"
      - future_chr = "◌"
      - "[colors]"
      - reached = "cyan"
      - todo = "magenta"
      - inactive = "light black"
