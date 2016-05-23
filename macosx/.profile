# $MacOSX: dot.profile Nov 17 15:00:00 GMT 2013, nishalr

OPATH=${PATH}

PATH=~/Library/Python/2.7/bin
PATH=${PATH}:/opt/local/bin
PATH=${PATH}:/opt/local/sbin
PATH=${PATH}:${OPATH}

unset OPATH

MANPATH=${MANPATH}:~/Library/Python/2.7/man
MANPATH=${MANPATH}:/opt/local/share/man

MANWIDTH=80

HISTSIZE=15000
HISTFILESIZE=2000

LSCOLORS="Ex"

export PATH MANPATH MANWIDTH HISTSIZE HISTFILESIZE LSCOLORS

# set the prompt
if [ $(id -u) == 0 ]
then
    PS1="\[\033[00;31m\]\u@\h: \W $ \[\033[01;0m\]"
else
    PS1="\[\033[01;32m\]\u@\h:\[\033[00m\] \W $ \[\033[01;0m\]"
fi

# user aliases
alias ls='ls -G'
alias l='ls -la'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='env TERM=screen-256color tmux'

# if we're not already running under tmux try to attach
# to any running sessions
if [ -z "${TMUX}" ]
then
    if [ ${TERM} != "screen" ]
    then
        tmux attach > /dev/null 2>&1
    fi
fi

# add ssh identities to agent
ssh-add > /dev/null 2>&1
