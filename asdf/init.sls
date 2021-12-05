installed:
  git.cloned:
    - name: https://github.com/asdf-vm/asdf.git
    - target: {{ pillar['xdg_data_home'] }}/asdf
    - user: orlando
  
