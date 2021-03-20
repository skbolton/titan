direnv:
  {% if grains['os'] == 'MacOS' %}
  cmd.run:
    - name: brew install direnv
  {% else %}
  cmd.run:
    - name: paru -S direnv --skipreview --noconfirm
    - runas: orlando
  {% endif %}
