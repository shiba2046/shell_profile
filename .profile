
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

alias ls="ls -h"
#alias python="python3"
alias du1='du -h -d1'
alias apt='sudo apt'
alias cddev='cd ~/dev'

# =================================
# NVM Enviroment
# =================================

if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export NVM_NODEJS_ORG_MIRROR="https://mirrors.ustc.edu.cn/node/"
    export NODE_MIRROR="https://mirrors.ustc.edu.cn/node/"
fi


[ -d "/home/linuxbrew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[ -f "$HOME/.cargo/env" ] && 
# =================================
# WSL Enviroment
# =================================

HOSTNAME=$(cat /etc/hostname)

if [[ -n "$IS_WSL" || -n "$WSL_DISTRO_NAME" ]]; then
    source "$HOME/shell_profile/.wsl"
fi

[ -f "$HOME/shell_profile/.adb" ] && source $HOME/shell_profile/.adb
export DISPLAY=172.23.0.1:0.0
export DISPLAY=172.31.16.1:0.0
export GPG_TTY=$(tty)
