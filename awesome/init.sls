include:
  - lua
  - rofi
  - fonts
  - cli-utils
  - networking

{% set awesome_dir = pillar['xdg_config_home'] + '/awesome' %}

awesome:
  pkg.installed

acpid:
  pkg.installed:
    - name: acpid
  service.running:
    - name: acpid
    - enable: True

awesome-configs:
  file.recurse:
    - name: {{ awesome_dir }}
    - source: salt://awesome/awesome
    - user: orlando
    - makedirs: True
    - force: True
    - template: jinja

rubato:
  git.latest:
    - name: https://github.com/andOrlando/rubato.git
    - target: {{ awesome_dir }}/module/rubato
    - user: orlando

awesome-bling:
  git.latest:
    - name: https://github.com/BlingCorp/bling
    - target: {{ awesome_dir }}/module/bling
    - user: orlando

awesome-widgets:
  git.latest:
    - name: https://github.com/streetturtle/awesome-wm-widgets.git
    - target: {{ awesome_dir }}/awesome-wm-widgets
    - user: orlando

