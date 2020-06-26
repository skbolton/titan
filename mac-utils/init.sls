# This file is for small command line utils that don't have config files
# and I can just condense them to one spot
ripgrep:
  pkg.installed:
    - name: rg
    - unless: brew list rg

neofetch:
  pkg.installed:
    - name: neofetch
    - unless: brew list neofetch

sk:
  pkg.installed:
    - name: sk

tree:
  pkg.installed:
    - name: tree
    - unless: brew list tree

task:
  pkg.installed:
    - name: task
    - unless: brew list task

Asciiquarium:
  pkg.installed:
    - name: Asciiquarium
    - unless: brew list Asciiquarium

yarn:
  pkg.installed:
    - name: yarn
    - unless: brew list yarn

gotop:
  cmd.run:
    - names:
      - brew install gotop
      - brew tap cjbassi/gotop
    - unless: brew list gotop
