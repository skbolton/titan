ripgrep:
  pkg.installed

exa:
  pkg.installed

bpytop:
  pkg.installed

skim:
  pkg.installed

op:
  cmd.run:
    - names:
      - gpg --recv-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
      - paru -S 1password-cli --noconfirm --skipreview
    - runas: orlando

  
  
