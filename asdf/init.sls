include:
  - direnv

asdf-installed:
  cmd.run:
    - name: paru -S asdf-vm --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi asdf-vm
  
asdf-direnv:
  cmd.run:
    - env:
      - ASDF_DATA_DIR: {{ pillar['xdg_data_home'] }}/asdf
    - name: source /opt/asdf-vm/asdf.sh && asdf plugin-add direnv
    - runas: {{ grains['user'] }}
