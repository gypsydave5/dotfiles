# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything

#GNU utils
## adds the gnu versions of the utils

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
force_color_prompt=yes

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

export PATH="$PATH:/usr/local/sbin" # rabbit-mq path

### Sets the Mail Environment Variable
export MAIL=/var/spool/mail/davidwic

eval "$(direnv hook bash)"

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

# C Libraries
export LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH

# Docker
source $HOME/.bash_plugins/docker.sh

# ls colors
source $HOME/.bash_plugins/ls_colors.sh

## Python
# only use pip in a virtual env
export PIP_REQUIRE_VIRTUALENV=true

# Ruby
export RUBIES=$HOME/.rubies
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby

#default email address
export EMAIL=dave.wickes@gmail.com

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#dot
export GRAPHVIZ_DOT=/usr/local/opt/graphviz/bin/dot

#Rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

# Perl shizzle
PATH="/Users/davidwic/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/davidwic/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/davidwic/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/davidwic/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/davidwic/perl5"; export PERL_MM_OPT;

export PATH=$PATH:/Library/TeX/texbin

#Clojure Boot
export BOOT_JVM_OPTIONS="-client
-XX:+TieredCompilation
-XX:TieredStopAtLevel=1
-Xmx2g
-XX:+UseConcMarkSweepGC
-XX:+CMSClassUnloadingEnabled
-Xverify:none"

#Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#NodeJS
nvm use node

# QOTD
if type fortune > /dev/null; then
    echo ""
    fortune
    echo ""
fi

alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias
