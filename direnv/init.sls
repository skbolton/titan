direnv:
  {% if grains['os'] == 'MacOS' %}
  cmd.run:
    - name: brew install direnv
  {% else %}
  cmd.run:
    - name: yay -S direnv
  {% endif %}
