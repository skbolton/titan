# Yubikey and GPG configuration

yubikey-manager:
  cmd.run:
    - name: paru -S yubikey-manager --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi yubikey-manager

pcscd:
  service.running:
    - enable: True

# passwordless authentication
pam-u2f: pkg.installed

pam-sudo:
  file.managed:
    - name: /etc/pam.d/sudo
    - source: salt://gpg/sudo
    - template: jinja
    - require:
      - pkg: pam-u2f

gpg-config-dir:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/gpg
    - user: orlando
    - dir_mode: 700
    - file_mode: 600

gpg-agent-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/gpg/gpg-agent.conf
    - source: salt://gpg/gpg-agent.conf
    - user: orlando

gpg-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/gpg/gpg.conf
    - source: salt://gpg/gpg.conf
    - user: orlando

my-gpg-key:
  gpg.present:
    - keys: 35BE29E174F8981ECF31D03C60410414D406AF1D
    - user: orlando
    - gnupghome: {{ pillar['xdg_config_home'] }}/gpg
    - trust: "ultimately"

