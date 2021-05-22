# Make sure we have asdf before continuing
include:
  - asdf

{% set erlang_version = '23.2.3' %}
{% set elixir_version = '1.11.3-otp-23' %}

# IMPORTANT: Asdf is a sourced function
# Since we might be in a shell that hasn't yet sourced it we need to source it before any calls to asdf

asdf-erlang-plugin:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
    - runas: orlando
    - unless: source ~/.asdf/asdf.sh; asdf plugin list all | grep erlang

asdf-erlang-install:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf install erlang {{ erlang_version }}
    - runas: orlando

asdf-erlang-global:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf global erlang {{ erlang_version }}
    - runas: orlando

# install elixir
asdf-elixir-plugin:
  pkg.installed:
    - name: unzip
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
    - runas: orlando
    - unless: source ~/.asdf/asdf.sh; asdf plugin list all | grep elixir

asdf-elixir-install:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf install elixir {{ elixir_version }}
    - runas: orlando

asdf-elixir-global:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf global elixir {{ elixir_version }}
    - runas: orlando

install-package-toolchains:
  cmd.run:
    - name: source ~/.asdf/asdf.sh; asdf reshim; mix local.hex --if-missing --force; mix local.rebar --force
    - runas: orlando
    - env:
      - LANG: en_US.UTF-8

# get language server in place
elixir-language-server:
  git.latest:
    - name: https://github.com/elixir-lsp/elixir-ls.git
    - target: /home/orlando/.local/share/elixir-ls
    - user: orlando

  cmd.run:
    - cwd: /home/orlando/.local/share/elixir-ls
    - runas: orlando
    - name: source ~/.asdf/asdf.sh; asdf reshim; mix deps.get; mix compile; mix elixir_ls.release -o rel
    - env:
      - LANG: en_US.UTF-8
    - onchanges:
      - git: elixir-language-server
