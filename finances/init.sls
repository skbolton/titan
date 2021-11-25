include:
  - python
  - node

beancount: pip.installed

beancount-langserver:
  cmd.run:
    - name: npm i -g beancount-langserver
    - unless: npm list -g beancount-langserver

fava: pip.installed

fava-service:
  file.managed:
    - name: /etc/systemd/system/fava.service
    - source: salt://finances/fava.service
    - makedirs: True

fava-service-running:
  service.running:
    - name: fava
    - enable: true
    - require:
      - file: fava-service