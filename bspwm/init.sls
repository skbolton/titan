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
    - name: {{ pillar['xdg_config_home'] }}/bspwm
    - makedirs: True
    - user: orlando

bspwm-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/bspwm/bspwmrc
    - source: salt://bspwm/bspwmrc
    - user: orlando
    - mode: keep
    - force: True

bspwm-specific-sxhkd:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/bspwm/bspwm-sxhkdrc
    - source: salt://bspwm/bspwm-sxhkdrc
    - makedirs: True
    - user: orlando
    - force: True

betterlockscreen:
  cmd.run:
    - name: paru -S betterlockscreen --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi betterlockscreen
