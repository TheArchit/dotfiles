# $OpenBSD: dot.profile Dec 7 13:11:57 GMT 2012, nishalr
#
# sh/ksh initialisation

# common ksh / bash initialisation
PATH=${HOME}/bin:${HOME}/sbin
PATH=${PATH}:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin
PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/usr/games

umask 027

case "$-" in
    *i*) # interactive shell displays daily quote
        if [ ! -f ~/.hushlogin ] ; then
            /usr/games/fortune -a
        fi
    ;;
esac

# Global settings
LC_ALL="en_US.UTF-8" 
LANG="en_US.UTF-8"
HISTSIZE=15000
HISTFILESIZE=2000
EDITOR="/usr/local/bin/vim"
PAGER="less"
TOP="-s1 -H"

export LC_ALL LANG PATH HOME TERM EDITOR PAGER TOP

# ksh-specific initialisation
if [ "${SHELL}" == "/bin/ksh" ] ; then
    # system-wide initialisation for ksh
    if [ -f /etc/ksh.kshrc ] ; then
        . /etc/ksh.kshrc
    fi
    # ksh user customisations
    if [ -f ~/.kshrc ] ; then
        . ~/.kshrc
    fi
fi

# Define some colours for PS prompts
norm  () { echo -n "\033[0m" ; }
red   () { echo -n "\033[0;31m" ; }
green () { echo -n "\033[0;32m" ; }

# Set the prompt
if [ `id -u` == 0 ] ; then
    PS1="`red`[\u@\h: \W]\\$ `norm`"
else
    PS1="`green`[\u@\h: \W]\\$ `norm`"
fi

# User aliases
if [ -x /usr/local/bin/colorls ] ; then
    alias ls='colorls -FG'
fi

if [ -x /usr/local/bin/vim ] ; then
    alias vi='/usr/local/bin/vim'
fi

alias l='ls -la'
alias ll='ls -l'
alias cp='cp -i'
alias mv="mv -i"

# If we're not already running under tmux try to attach
# to any running sessions
if [ -n ${TMUX} ] ; then
    if [ ${TERM} != "screen" ] ; then
        tmux attach > /dev/null 2>&1
    fi
fi
