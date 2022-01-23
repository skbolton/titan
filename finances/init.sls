include:
  - lang.python
  - lang.node

beancount: pip.installed

beancount-langserver:
  cmd.run:
    - name: npm i -g beancount-langserver
    - unless: npm list -g beancount-langserver
    - runas: {{ grains['user'] }}

fava: pip.installed

fava-service:
  file.managed:
    - name: /etc/systemd/system/fava.service
    - template: jinja
    - source: salt://finances/fava.service
    - makedirs: True

fava-service-running:
  service.running:
    - name: fava
    - enable: true
    - require:
      - file: fava-service
