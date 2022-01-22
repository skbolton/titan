gpg-config-dir:
  file.directory:
    - name: {{ pillar['xdg_config_home'] }}/gpg
    - user: {{ grains['user'] }}
    - dir_mode: 700
    - file_mode: 600

gpg-agent-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/gpg/gpg-agent.conf
    - source: salt://gpg/gpg-agent.conf
    - user: {{ grains['user'] }}

gpg-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/gpg/gpg.conf
    - source: salt://gpg/gpg.conf
    - user: {{ grains['user'] }}

my-gpg-key:
  gpg.present:
    - keys: 35BE29E174F8981ECF31D03C60410414D406AF1D
    - user: {{ grains['user'] }}
    - gnupghome: {{ pillar['xdg_config_home'] }}/gpg
    - trust: "ultimately"

