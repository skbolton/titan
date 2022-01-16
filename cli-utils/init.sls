flameshot:
  pkg.installed

ripgrep:
  pkg.installed

exa:
  pkg.installed

bpytop:
  pkg.installed

skim:
  pkg.installed

fzf:
  pkg.installed

bat:
  pkg.installed

jq:
  pkg.installed

op:
  cmd.run:
    - names:
      - gpg --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi 1password-cli

hsetroot:
  pkg.installed

toilet:
  cmd.run:
    - name: paru -S toilet --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi toilet

figlet:
  cmd.run:
    - name: paru -S figlet --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi figlet

synology-drive:
  cmd.run:
    - names:
      - paru -S synology-drive --noconfirm --skipreview
    - runas: orlando
    - unless: paru -Qi synology-drive

remind: pkg.installed
  
netcat:
  pkg.installed: 
    - name: openbsd-netcat

