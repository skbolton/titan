xorg:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-xinit
      - xorg-server-xephyr
      - xorg-xrandr
      - xorg-xprop
      - xclip
      - xorg-xrdb

xresources:
  file.managed:
    - name: /home/orlando/.Xresources
    - source: salt://xorg/.Xresources
    - user: orlando

xprofile:
  file.managed:
    - name: /home/orlando/.xprofile
    - source: salt://xorg/.xprofile
    - user: orlando

