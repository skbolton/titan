include:
  - flatpak

flameshot:
  pkg.installed

ripgrep:
  pkg.installed

exa:
  pkg.installed

btop:
  pkg.installed

skim:
  pkg.installed

fzf:
  pkg.installed

bat:
  pkg.installed:
    - name: bat
  file.managed:
    - name: {{ pillar['xdg_config_home'] }}/bat/config
    - contents: --theme="base16"
    - makedirs: True
    - user: {{ grains['user'] }}

jq:
  pkg.installed

op:
  cmd.run:
    - names:
      - gpg --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi 1password-cli

hsetroot:
  pkg.installed

toilet:
  cmd.run:
    - name: paru -S toilet --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi toilet

figlet:
  cmd.run:
    - name: paru -S figlet --noconfirm --skipreview
    - runas: {{ grains['user'] }}
    - unless: paru -Qi figlet

synology-drive:
  cmd.run:
    - name: flatpak install -y flathub com.synology.SynologyDrive

remind: pkg.installed
  
netcat:
  pkg.installed: 
    - name: openbsd-netcat

