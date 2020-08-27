# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything

#GNU utils

### some environment variables ###
export TERM=xterm-256color
export EDITOR=vi

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
HISTSIZE=100000
HISTFILESIZE=200000

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

### Sets the Mail Environment Variable

eval "$(direnv hook bash)"

# autojump path
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# homebrew autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# AWS CLI Autocomplete
complete -C aws_completer aws

# emacs daemon
export ALTERNATE_EDITOR=""

# prompt
source $HOME/.bash_plugins/prompt.sh

# Browser
export BROWSER=w3m

# Docker
source $HOME/.bash_plugins/docker.sh

# ls colors
source $HOME/.bash_plugins/ls_colors.sh

## Python
# only use pip in a virtual env
export PIP_REQUIRE_VIRTUALENV=false

#default email address
export EMAIL=david.wickes@springernature.com

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#Clojure Boot
export BOOT_JVM_OPTIONS="-client
-XX:+TieredCompilation
-XX:TieredStopAtLevel=1
-Xmx2g
-XX:+UseConcMarkSweepGC
-XX:+CMSClassUnloadingEnabled
-Xverify:none"

#Jenv
export JENV_ROOT=/usr/local/opt/jenv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# QOTD
if type fortune > /dev/null; then
  printf "\n$(fortune)\n"
fi

HISTIGNORE='fg'
