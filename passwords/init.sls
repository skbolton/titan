pass: pkg.installed

passstore:
  git.cloned:
    - name: git@github.com:skbolton/password-store.git
    - target: {{ pillar['xdg_data_home'] }}/password-store
    - user: {{ grains['user'] }}
    - require:
      - pkg: pass

pass-fzf:
  file.managed:
    - name: {{ pillar['xdg_data_home'] }}/password-store/.extensions/fzf.bash
    - source: salt://passwords/fzf.bash
    - mode: keep
    - user: {{ grains['user'] }}
    - force: true
    - makedirs: true

pass-otp: pkg.installed

zbar: pkg.installed

browserpass-firefox: pkg.installed

