go: pkg.installed

go-dir:
  file.directory:
    - name: {{ pillar['go_path'] }}

go-pls:
  cmd.run:
    - name: go install golang.org/x/tools/gopls@latest
    - runas: orlando
    - env:
      - GOPATH: {{ pillar['go_path'] }}

