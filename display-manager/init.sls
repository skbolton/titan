lightdm:
  pkg.installed:
    - name: lightdm

lightdm-started:
  service.enabled:
    - name: lightdm
    - enable: True
    - require:
      - pkg: lightdm

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
  

