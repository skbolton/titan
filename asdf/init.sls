installed:
  git.cloned:
    - name: https://github.com/asdf-vm/asdf.git
    - target: {{ salt["environ.get"]("HOME") }}/.asdf
    - user: {{ salt["environ.get"]("USER") }}
  
