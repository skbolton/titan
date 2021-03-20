include:
  - asdf

asdf-rust:
  cmd.run:
    - names:
      # We have to source the script first since we might be running in a zsh session
      # that doesn't have it source in the rc
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf plugin-add rust"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf install rust stable"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf global rust stable"
    - unless: /bin/zsh -c "source ~/.asdf/asdf.sh; asdf current rust"

default-crates:
  file.managed:
    - name: /home/orlando/.default-cargo-crates
    - contents:
      - dijo
    - user: orlando


