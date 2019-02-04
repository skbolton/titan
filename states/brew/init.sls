brew-bundle:
  cmd.run:
    - name: brew bundle --file={{ grains.statesdir}}/brew/brewfile
