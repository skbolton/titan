include:
  - user
  - flatpak

docker: pkg.installed

docker-compose: pkg.installed

docker-group:
  group.present:
    - name: docker
    - addusers:
      - {{ grains['user'] }}

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
    - runas: {{ grains['user'] }}

no-insomnia-aur:
  cmd.run:
    - name: paru -R insomnia
    - runas: {{ grains['user'] }}
    - onlyif:
      - paru -Qi insomnia

insomnia-installed:
  cmd.run:
    - name: flatpak install flathub rest.insomnia.Insomnia
    - runas: {{ grains['user'] }}
