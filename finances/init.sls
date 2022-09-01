include:
  - lang.rust
  - lang.python
  - lang.node

beancount: pip.installed

beancount-langserver:
  cmd.run:
    - name: cargo install beancount-language-server
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
