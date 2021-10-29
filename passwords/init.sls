pass: pkg.installed

passstore:
  git.cloned:
    - name: https://github.com/skbolton/password-store.git
    - target: /home/orlando/.local/share/password-store
    - user: orlando
    - require:
      - pkg: pass

pass-fzf:
  file.managed:
    - name: /home/orlando/.local/share/password-store/.extensions/fzf.bash
    - source: salt://passwords/fzf.bash
    - mode: keep
    - user: orlando
    - force: true
    - makedirs: true


