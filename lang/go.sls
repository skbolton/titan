go: pkg.installed

go-dir:
  file.directory:
    - name: {{ pillar['go_path'] }}
    - user: {{ grains['user'] }}

go-pls:
  cmd.run:
    - name: go install golang.org/x/tools/gopls@latest
    - runas: orlando
    - env:
      - GOPATH: {{ pillar['go_path'] }}

