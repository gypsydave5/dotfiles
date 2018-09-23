#!/bin/bash
dircolors_path=$(which dircolors)
if [ -x "$dircolors_path" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -G'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git aliases
alias gs='git status -sb '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gp='git pull'
alias got='git '
alias gut='git '

# vim
alias vi='vi'
alias vim='vi'

# intellij
alias ij='open -b com.jetbrains.intellij.ce'

# mocha for coffeescript
alias mocafe='mocha --compilers coffee:coffee-script/register'

# emacs
alias ec="emacsclient -t"
alias sec="sudo emacsclient -t"
alias vec="emacsclient -c -a emacs"

# tmux
alias tmux="tmux -u" # ensures unicode mode

