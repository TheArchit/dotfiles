# $MacOSX: dot.profile Nov 17 15:00:00 GMT 2013, nishalr

PATH=/opt/local/bin:/opt/local/sbin:${PATH}
MANPATH=/opt/local/share/man:${MANPATH}

HISTSIZE=15000
HISTFILESIZE=2000

export PATH MANPATH HISTSIZE HISTFILESIZE

# Set the prompt
if [ $(id -u) == 0 ] ; then
    PS1="\[$(tput setaf 1)\][\u@\h: \W] $ \[$(tput sgr0)\]"
else
    PS1="\[$(tput setaf 2)\][\u@\h: \W] $ \[$(tput sgr0)\]"
fi

# User aliases
alias l='ls -laG'
alias ll='ls -lG'
alias cp='cp -i'
alias mv="mv -i"

# If we're not already running under tmux try to attach
# to any running sessions
if [ -z "${TMUX}" ] ; then
    if [ ${TERM} != "screen" ] ; then
        tmux -2 attach > /dev/null 2>&1
    fi
fi

# Add ssh identities to agent
ssh-add > /dev/null 2>&1
