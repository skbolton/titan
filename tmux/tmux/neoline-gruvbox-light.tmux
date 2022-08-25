set -g status-interval 3
set-option -g status-position bottom
set-option -g pane-active-border-style "fg=green"
set-option -g pane-border-style "fg=brightwhite"
set-option -g message-style "bg=green,fg=black"
set-option -g message-command-style "bg=green,fg=black"

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator ""
set -g status-bg "black"

#Bars ---------------------------------
set -g status-left "#[bg=#7c6f64,fg=black italics] #(tmux run-shell 'tmux display-message -p \"#S\" | tr \"[:lower:]\" \"[:upper:]\"') #[fg=#7c6f64,bg=black]"

set -g status-right "#[fg=#a89984]#[bg=#a89984,fg=black] %Y-%m-%d #[fg=#a89984,bg=#928374] #[fg=black,bg=#928374]%I:%M#[fg=#928374]#[fg=#7c6f64]#[bg=#7c6f64,fg=black italics] @#H "

# Windows ------------------------------
set -g status-justify left

set -g window-status-format "#[fg=#a89984]#[fg=black,bg=#a89984] #{?window_zoomed_flag,  ,}#W #[bg=black,fg=#a89984]"
set -g window-status-current-format "#[fg=brightcyan]#[bg=brightcyan,fg=black] #W #{?window_zoomed_flag,  ,}#[fg=brightcyan,bg=black]"
