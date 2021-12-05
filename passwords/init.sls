pass: pkg.installed

passstore:
  git.cloned:
    - name: https://github.com/skbolton/password-store.git
    - target: {{ pillar['xdg_data_home'] }}/password-store
    - user: orlando
    - require:
      - pkg: pass

pass-fzf:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/password-store/.extensions/fzf.bash
    - source: salt://passwords/fzf.bash
    - mode: keep
    - user: orlando
    - force: true
    - makedirs: true

pass-otp: pkg.installed

zbar: pkg.installed


