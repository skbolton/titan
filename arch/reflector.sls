reflector:
  pkg.installed:
    - name: reflector

reflector-config:
  file.managed:
    - name: /etc/xdg/reflector/reflector.conf
    - source: salt://arch/reflector.conf
    - require:
      - pkg: reflector
    - onchanges:
      - pkg: reflector

reflector-running:
  service.running:
    - name: reflector.timer
    - enable: True
    - require:
      - pkg: reflector
    - onchanges:
      - pkg: reflector

