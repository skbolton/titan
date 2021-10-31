lightdm:
  pkg.installed:
    - name: lightdm

lightdm-started:
  service.enabled:
    - name: lightdm
    - enable: True
    - require:
      - pkg: lightdm

lightdm-greeter:
  cmd.run:
    - name: paru -S lightdm-webkit2-greeter --noconfirm --skipreview
    - unless: paru -Qi lightdm-webkit2-greeter
    - runas: orlando
    - require:
      - pkg: lightdm

lightdm-aether:
  cmd.run:
    - name: paru -S lightdm-webkit-theme-aether --noconfirm --skipreview
    - unless: paru -Qi lightdm-webkit-theme-aether
    - runas: orlando
    - require:
      - pkg: lightdm
  

