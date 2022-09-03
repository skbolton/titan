# vim: set ft=tmux:
set -g status-interval 3
set-option -g status-position top
set-option -g pane-active-border-style "fg=green"
set-option -g pane-border-style "fg=brightwhite"
set-option -g message-style "bg=green,fg=black"
set-option -g message-command-style "bg=green,fg=black"

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator "  "
set -g status-bg "black"

#Bars ---------------------------------
set -g status-left "#[fg=blue]#S #[fg=brightwhite]⎥ "

set -g status-right "#[fg=brightwhite] #[push-default]%Y-%m-%d#[fg=brightwhite] ⎥ #[fg=default]%I:%M #[fg=brightwhite]⎥ #[fg=blue italics]@#H"

# Windows ------------------------------
set -g status-justify centre

set -g window-status-format "#[fg=brightwhite]#{?window_zoomed_flag,▪#W,#W}"
set -g window-status-current-format "#[fg=green]#{?window_zoomed_flag,▪#W,#W}"
