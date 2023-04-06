#!/bin/bash

# -c creates a new window rather than using current
if [[ "$1" = "-c" ]]
then
  tmux new-window -n " " nvim +"set filetype=elixir"
else
  tmux send-keys 'nvim +"set filetype=elixir"' Enter
fi

tmux split-window -d -l 25% "iex -S mix"

