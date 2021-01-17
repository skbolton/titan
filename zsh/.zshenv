# ZSH env configuration
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"

export PATH="$GOPATH/bin:"$HOME"/.local/bin:"$HOME"/.cargo/bin:$PATH"
export EDITOR="nvim"
export GOPATH=$HOME/go
export SKIM_DEFAULT_COMMAND="rg --files --hidden -g !.git"

export LEDGER_FILE="$HOME/Documents/sync/Finances/$(date +%Y)/$(date +%Y).journal"

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Android config
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export _JAVA_AWT_WM_NONREPARENTING=1

# Git helpers
# Fallback value when review base is not set
# This environment sets up what the "master" branch is for a repo
# in case a repo uses a non standard version
export REVIEW_BASE=master
