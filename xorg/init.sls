{% from "xorg/map.jinja" import display_drivers with context %}

xorg:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-server-xephyr
      - xorg-xrandr
      - xorg-xprop
      - xclip

display-driver:
  pkg.installed:
    - pkgs:
      - {{ display_drivers.driver }}
      - {{ display_drivers.open_gl }}
