elixir:
  pkg.installed

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
