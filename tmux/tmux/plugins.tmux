# vim: set ft=tmux:
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'fcsonline/tmux-thumbs'
set -g @plugin 'sainnhe/tmux-fzf'

# Thumbs
set -g @thumbs-key '='
set -g @thumbs-reverse enabled
set -g @thumbs-regexp-1 'cu-.*'
set -g @thumbs-regexp-2 'genesis-server-\S+'
set -g @thumbs-hint-bg-color yellow
set -g @thumbs-hint-fg-color black
set -g @thumbs-contrast 1

# fuzzback
set -g @fuzzback-popup 1
set -g @fuzzback-popup-size '90%'

run-shell ~/.config/tmux/plugins/tmux-fuzzback/fuzzback.tmux
