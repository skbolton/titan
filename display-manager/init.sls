lightdm:
  pkg.installed:
    - name: lightdm

lightdm-started:
  service.dead:
    - name: lightdm
    - enable: False


lightdm-config:
  file.managed:
    - name: /etc/lightdm/lightdm.conf
    - source: salt://display-manager/lightdm.conf

lightdm-greeter:
  cmd.run:
    - name: paru -S lightdm-webkit2-greeter --noconfirm --skipreview
    - unless: paru -Qi lightdm-webkit2-greeter
    - runas: {{ grains['user'] }}
    - require:
      - pkg: lightdm

lightdm-osmos:
  cmd.run:
    - name: paru -S lightdm-webkit-theme-osmos --noconfirm --skipreview
    - unless: paru -Qi lightdm-webkit-theme-osmos
    - runas: {{ grains['user'] }}
    - require:
      - pkg: lightdm
  
sddm: 
  pkg.installed:
    - name: sddm
  service.enabled:
    - name: sddm
    - enable: True

sddm-config:
  file.managed:
    - name: /etc/sddm.conf.d/sddm.conf
    - source: salt://display-manager/sddm.conf
    - makedirs: True
    - require:
      - pkg: sddm

sddm-catppuccin-theme:
  git.cloned:
    - name: https://github.com/catppuccin/sddm
    - target: /usr/share/sddm/themes/catppuccin
