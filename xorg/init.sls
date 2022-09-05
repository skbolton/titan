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

{% if grains.get('host') == 'neo' %}
xorg-keyboard:
  file.managed:
    - name: /etc/X11/xorg.conf.d/00-keyboard.conf
    - source: salt://xorg/xorg.conf.d/00-keyboard.conf
{% endif %}
  
