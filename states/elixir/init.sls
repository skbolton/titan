# Make sure we have asdf before continuing
include:
  - asdf

# IMPORTANT: Asdf is a sourced function
# Since we might be in a shell that hasn't yet sourced it we need to source it before any calls to asdf

# install asdf-erlang and erlang
asdf-erlang:
  cmd.run:
    # important these scripts get run in reverse order
    - names: 
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf global erlang 22.0.7"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf install erlang 22.0.7"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git"
    # If we already have erlang move on
    - unless: /bin/zsh -c "source ~/.asdf/asdf.sh; asdf current erlang"

# install elixir
asdf-elixir:
  cmd.run:
    # important these scripts get run in reverse order
    - names: 
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf global elixir 1.9.2-otp-22"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf install elixir 1.9.2-otp-22"
      - /bin/zsh -c "source ~/.asdf/asdf.sh; asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git"
    # skip if we have elixir already
    - unless: /bin/zsh -c "source ~/.asdf/asdf.sh; asdf current elixir"

install-package-toolchains:
  cmd.run:
    - names: 
      - mix local.hex --if-missing
      - mix local.rebar --force

# get language server in place
elixir-language-server:
  git.cloned:
    - name: https://github.com/JakeBecker/elixir-ls.git
    - target: {{ grains.homedir }}/.elixir-ls

  cmd.run:
    - cwd: {{ grains.homedir }}/.elixir-ls
    - names:
      - mix deps.get
      - mix compile
      - mix elixir_ls.release -o rel
