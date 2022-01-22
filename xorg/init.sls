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
    - name: /home/{{ grains['user'] }}/.Xresources
    - source: salt://xorg/.Xresources
    - user: {{ grains['user'] }}

xprofile:
  file.managed:
    - name: /home/{{ grains['user'] }}/.xprofile
    - source: salt://xorg/.xprofile
    - user: {{ grains['user'] }}

