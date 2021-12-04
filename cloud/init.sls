include:
  - orlando

docker: pkg.installed

docker-group:
  group.present:
    - name: docker
    - addusers:
      - orlando

docker-running:
  service.running:
    - enable: True
    - name: docker
    - require:
      - pkg: docker
    - watch:
      - group: docker-group

postgresql: pkg.installed

google-cloud-sdk:
  cmd.run:
    - name: paru -S google-cloud-sdk --noconfirm --skipreview
    - unless: paru -Qi google-cloud-sdk
    - runas: orlando
