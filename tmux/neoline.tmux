set -g status-interval 3
set-option -g status-position bottom

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator ""
set -g status-bg "black"

#Bars ---------------------------------
set -g status-left "#[bg=#19172C,fg=brightwhite] #(tmux run-shell 'tmux display-message -p \"#S\" | tr \"[:lower:]\" \"[:upper:]\"') #[fg=#19172C,bg=black]"

set -g status-right "#[fg=#37354A]#[bg=#37354A,fg=brightwhite]%Y-%m-%d #[fg=#37354A,bg=#2D2B40] #[fg=brightwhite,bg=#2D2B40]%I:%M#[fg=#2D2B40]#[fg=#19172C,bg=#2D2B40]#[bg=#19172C,fg=brightwhite italics] @#H "

# Windows ------------------------------
set -g status-justify left

set -g window-status-format "#[fg=#2D2B40]#[fg=brightwhite,bg=#2D2B40] #{?window_zoomed_flag,  ,}#W #[bg=black,fg=#2D2B40]"
set -g window-status-current-format "#[fg=#63F2F1]#[bg=#63F2F1,fg=black] · #{?window_zoomed_flag,  ,}#[fg=#63F2F1,bg=black]"
