reflector:
  pkg.installed:
    - name: reflector

reflector-config:
  file.symlink:
    - name: /etc/xdg/reflector/reflector.conf
    - target: /home/orlando/titan/arch/reflector.conf
    - require:
      - pkg: reflector
    - onchanges:
      - pkg: reflector

reflector-running:
  service.running:
    - enable: True
    - require:
      - pkg: reflector
    - onchanges:
      - pkg: reflector

