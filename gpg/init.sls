gpg-agent-config:
  file.symlink:
    - name: /home/orlando/.gnupg/gpg-agent.conf
    - target: /home/orlando/titan/gpg/gpg-agent.conf
    - user: orlando
    - makedirs: True
