pass: pkg.installed

passstore:
  git.latest:
    - name: https://github.com/skbolton/password-store.git
    - target: /home/orlando/.cache/password-store
    - user: orlando
    - require:
      - pkg: pass
