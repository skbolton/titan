set -g status-interval 3
set-option -g status-position bottom

# Status line
set -g status-style default
set -g status-right-length 80
set -g status-left-length 100
set -g window-status-separator "" 
set -g status-bg black

#Bars ---------------------------------
set -g status-left "#[fg=black,bg=brightcyan]  #S #[fg=brightcyan,bg=black]"
set -g status-right "#[fg=black,bg=cyan]#[fg=black,bg=cyan] %Y-%m-%d / %I:%M #[fg=brightcyan,bg=cyan]#[bg=brightcyan,fg=black] #(whoami) "

# Windows ------------------------------
set -g status-justify left 
set -g window-status-format "#[fg=white] #I / #W "
set -g window-status-current-format "#[fg=black,bg=cyan]#[bg=cyan,fg=black] #I / #{?window_zoomed_flag,#[fg=cyan] ,}#[fg=black]#W #[fg=cyan,bg=black]"
