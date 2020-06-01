terminfos:
  cmd.run:
    - names:
      - tic -x {{ salt["environ.get"]("HOME") }}/titan/terminfo/xterm-256color-italic.terminfo
      - tic -x {{ salt["environ.get"]("HOME") }}/titan/terminfo/tmux-256color.terminfo
