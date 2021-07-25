include:
  - lua
  - rofi
  - fonts
  - cli-utils

awesome:
  pkg.installed

awestore:
  cmd.run:
   - name: luarocks --lua-version 5.3 install awestore

awesome-configs:
  file.recurse:
    - name: /home/orlando/.config/awesome
    - source: salt://awesome/awesome
    - user: orlando
    - makedirs: True
    - force: True

awesome-bling:
  git.latest:
    - name: https://github.com/BlingCorp/bling
    - target: /home/orlando/.config/awesome/module/bling
    - user: orlando

awesome-layout-machi:
  git.latest:
    - name: https://github.com/xinhaoyuan/layout-machi
    - target: /home/orlando/.config/awesome/module/layout-machi
    - user: orlando
