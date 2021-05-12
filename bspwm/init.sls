include:
  - sxhkd
  - cli-utils
  - dunst
  - polybar
  - rofi
  - picom
  - xorg

bspwm:
  pkg.installed

bspwm-config-directory:
  file.directory:
    - name: /home/orlando/.config/bspwm
    - makedirs: True
    - user: orlando

bspwm-config:
  file.managed:
    - name: /home/orlando/.config/bspwm/bspwmrc
    - source: salt://bspwm/bspwmrc
    - user: orlando
    - mode: keep
    - force: True

bspwm-specific-sxhkd:
  file.managed:
    - name: /home/orlando/.config/bspwm/bspwm-sxhkdrc
    - source: salt://bspwm/bspwm-sxhkdrc
    - makedirs: True
    - user: orlando
    - force: True
