# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything

#GNU utils
## adds the gnu versions of the utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

### some environment variables ###
export TERM=xterm-256color
export EDITOR=vi
export BROwSER=firefox

case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
#GNU utils
## adds the gnu versions of the utils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export PATH="$PATH:/usr/local/sbin" # rabbit-mq path

### Sets the Mail Environment Variable
export MAIL=/var/spool/mail/davidwic

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#nvm directory
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

eval "$(direnv hook bash)"

# bash vi mode
set -o vi

# autojump path
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# homebrew autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="$PATH:$HOME/bin" # My own special bins

# AWS CLI Autocomplete
complete -C aws_completer aws

# emacs daemon
export ALTERNATE_EDITOR=""

# prompt
source $HOME/.bash_plugins/prompt.sh

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk

# C Libraries
export LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH

# Browser
export BROWSER=firefox

# Docker
source $HOME/.bash_plugins/docker.sh

## Python
# only use pip in a virtual env
export PIP_REQUIRE_VIRTUALENV=true

# Ruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
# chruby on cd
source /usr/local/opt/chruby/share/chruby/auto.sh
export RUBIES=$HOME/.rubies

#default email address
export EMAIL=david.wickes@mergermarket.com

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# QOTD
if type fortune > /dev/null; then
    echo ""
    fortune -a
    echo ""
fi


