include:
  - yubikey

# passwordless authentication
pam-u2f: pkg.installed

pam-yubikeys:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/Yubico
    - user: {{ grains['user'] }}
  cmd.run:
    - name: pamu2fcfg -o pam://{{ grains['host'] }} -i pam://{{ grains['host'] }} >> {{ pillar['xdg_config_home'] }}/Yubico/u2f_keys
    - runas: {{ grains['user'] }}
  require:
    - pkg: pam-u2f

pam-sudo:
  file.managed:
    - name: /etc/pam.d/sudo
    - source: salt://pam/sudo
    - template: jinja
    - require:
      - pkg: pam-u2f

