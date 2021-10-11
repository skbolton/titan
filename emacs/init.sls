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
    - target: /home/orlando/.config/emacs
    - user: orlando

doom-configs:
  git.cloned:
    - name: https://github.com/skbolton/doom-emacs
    - target: /home/orlando/.config/doom
    - user: orlando
