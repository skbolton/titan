include:
  - fonts
  - cli-utils
  - mail

emacs: 
  pkg.installed:
    - name: emacs

doom:
  git.cloned:
    - name: https://github.com/hlissner/doom-emacs
    - target: {{ pillar['xdg_config_home'] }}/emacs
    - user: {{ grains['user'] }}

doom-configs:
  git.cloned:
    - name: https://github.com/skbolton/doom-emacs
    - target: {{ pillar['xdg_config_home'] }}/doom
    - user: {{ grains['user'] }}
