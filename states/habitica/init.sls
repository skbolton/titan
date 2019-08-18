installed:
  cmd:
    - run
    - name: /bin/zsh -c "source {{ grains.homedir }}/.nvm/nvm.sh; npm i -g habitica-cli"
# We have to do this as a managed file because I can't find a way
# to inject the credentials here at runtime. Instead I will just have to
# copy the stuff out of my password manager. This puts the file in the 
# correct spot
configs:
  file.managed:
    - name: {{grains.homedir}}/.config/habitica/auth.cfg
    - contents:
      - [Habitica]
      - url = https://habitica.com
      - login = <from password>
      - password = <from password>

