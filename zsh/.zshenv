# ZSH env configuration
export ZSH_DISABLE_COMPFIX=true
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# ZK
export ZK_NOTEBOOK_DIR="$HOME/Documents/Delta"

export GOPATH=$XDG_DATA_HOME/go
export GO111MODULE=on
export PATH="$GOPATH/bin:"$HOME"/.local/bin:"$XDG_DATA_HOME"/cargo/bin:"$HOME"/.local/share/gem/ruby/3.0.0/bin:$PATH"

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
