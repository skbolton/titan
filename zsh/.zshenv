# ZSH env configuration
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"
export MANPAGER="nvim -c 'set ft=man' -"

# XDG Base directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# GPG shenanigans
export GNUPGHOME=~/.config/gnupg
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# nnn config
export NNN_BMS='x:~/Documents/Warrior;w:~/Documents/Wolf;k:~/Documents/Wanderer'

export PATH="$GOPATH/bin:"$HOME"/.local/bin:"$HOME"/.cargo/bin:$PATH"
export EDITOR="nvim"
export BROWSER="firefox"
export GOPATH=$HOME/go

export SKIM_DEFAULT_COMMAND="rg --files --hidden -g !.git"
export SKIM_DEFAULT_OPTIONS="--reverse --ansi --color=fg:15,hl:03,hl+:03,matched_bg:-1,bg+:-1,fg+:-1,current_match_bg:-1,cursor:06,spinner:05,info:07,prompt:06"
export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"

export LEDGER_FILE="$HOME/Documents/Archive/Finances/$(date +%Y)/$(date +%Y).journal"

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
