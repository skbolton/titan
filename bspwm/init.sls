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
  file.symlink:
    - name: /home/orlando/.config/bspwm/bspwmrc
    - target: /home/orlando/titan/bspwm/bspwmrc
    - user: orlando
    - force: True

bspwm-specific-sxhkd:
  file.symlink:
    - name: /home/orlando/.config/bspwm/bspwm-sxhkdrc
    - target: /home/orlando/titan/bspwm/bspwm-sxhkdrc
    - makedirs: True
    - user: orlando
    - force: True
