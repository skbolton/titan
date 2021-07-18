xmonad:
  pkg.installed

xmonad-contrib:
  pkg.installed

xmonad-configs:
  file.managed:
    - name: /home/orlando/.xmonad/xmonad.hs
    - source: salt://xmonad/xmonad.hs
    - makedirs: True
    - user: orlando

