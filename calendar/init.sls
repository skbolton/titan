vdirsyncer: pkg.installed

{% set botm_root = '543afad6-2c0c-4c5f-9a12-31d28c96df38' %}
{% set botm_character = '8c5355b9-ee4b-4ae0-bb24-32dfe798d8ed' %}
{% set botm_hygiene = 'be6f35c3-da53-499c-a018-b98be62acd04' %}
{% set botm_health = 'd8a93df1-1367-4fcb-8d47-255da3f89fb8' %}
{% set botm_genesis = 'b32dae03-7e19-4d35-a7ea-481422e99bc8' %}
{% set botm_genesis_team = '17cce21b-355f-45fb-84d7-fecb09afdce7' %}
{% set botm_health = 'd8a93df1-1367-4fcb-8d47-255da3f89fb8' %}

vdirsyncer-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/vdirsyncer/config
    - source: salt://calendar/vdirsyncer-config
    - user: {{ grains['user'] }}
    - makedirs: True
    - template: jinja

khal: pkg.installed

khal-config:
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/khal/config
    - source: salt://calendar/khal-config
    - user: {{ grains['user'] }}
    - makedirs: True
    - template: jinja
    - defaults:
        botm_root: {{ botm_root }}
        botm_character: {{ botm_character }}
        botm_hygiene: {{ botm_hygiene }}
        botm_health: {{ botm_health }}
        botm_genesis: {{ botm_genesis }}
        botm_genesis_team: {{ botm_genesis_team }}
