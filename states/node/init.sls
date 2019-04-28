# Whatever you do be careful this shit took forever to work

clear_nvm:
  file.absent:
    - name: {{ grains.homedir }}/.nvm

install_nvm:
  cmd:
    - run
    - name: curl -L https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | bash
    - unless: test -d /{{ grains.homedir }}/.nvm
    - user: {{ grains.user }}

install_node:
  cmd:
    - run
    # NVM isn't actually an exectuable therefore some weird sourcing has to happen
    - name: /bin/zsh -c "source {{ grains.homedir }}/.nvm/nvm.sh; nvm install 10 && nvm alias default 10"
    - onlyif: /bin/bash -c "source ~/.nvm/nvm.sh; nvm ls 10 | grep 'N/A'"
    - user: {{ grains.user }}
    - require:
      - cmd: install_nvm

spaceship-prompt:
  cmd:
    - run
    - name: /bin/zsh -c "source {{ grains.homedir }}/.nvm/nvm.sh; npm install -g spaceship-prompt"
    - user: {{ grains.user }}
    - require:
      - cmd: install_node

dependencies:
  cmd:
    - run
    - name: /bin/zsh -c "source {{ grains.homedir }}/.nvm/nvm.sh; npm i -g yarn typescript livedown prettier npmr"

