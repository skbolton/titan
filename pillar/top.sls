base:
  '*':
    - xdg_dirs
    - go
  'trinity|neo':
    - match: pcre
    - taskwarrior
    - fonts.operator-mono
