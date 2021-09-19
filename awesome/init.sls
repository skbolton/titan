include:
  - lua
  - rofi
  - fonts
  - cli-utils

awesome:
  pkg.installed

awesome-configs:
  file.recurse:
    - name: /home/orlando/.config/awesome
    - source: salt://awesome/awesome
    - user: orlando
    - makedirs: True
    - force: True

rubato:
  git.latest:
    - name: https://github.com/andOrlando/rubato.git
    - target: /home/orlando/.config/awesome/module/rubato
    - user: orlando

awesome-bling:
  git.latest:
    - name: https://github.com/BlingCorp/bling
    - target: /home/orlando/.config/awesome/module/bling
    - user: orlando

awesome-widgets:
  git.latest:
    - name: https://github.com/streetturtle/awesome-wm-widgets.git
    - target: /home/orlando/.config/awesome/awesome-wm-widgets
    - user: orlando

awesome-layout-machi:
  git.latest:
    - name: https://github.com/xinhaoyuan/layout-machi
    - target: /home/orlando/.config/awesome/module/layout-machi
    - user: orlando
