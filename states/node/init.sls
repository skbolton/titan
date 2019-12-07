# we need asdf installed
include:
  - asdf

# IMPORTANT: Asdf is a sourced function
# Since we might be in a shell that hasn't yet sourced it we need to source it before any calls to asdf

asdf-node:
  pkg.installed:
    - name: gpg

  cmd.run:
    - names: 
      # We have to source the script first since we might be running in a zsh session
      # that doesn't have it source in the rc
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf global nodejs 12.13.1"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf install nodejs 12.13.1"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git"
    - unless: /bin/zsh -c "source ~/.asdf/asdf.sh; asdf current nodejs"

dependencies:
  cmd:
    - run
    - name: /bin/zsh -c " source ~/.asdf/asdf.sh; npm i -g livedown prettier npmrc habitica-cli"

