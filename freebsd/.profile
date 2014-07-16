# $FreeBSD: release/10.0.0/share/skel/dot.profile 2014-07-13 nishalr $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
PATH=${HOME}/bin:${HOME}/sbin
PATH=${PATH}:/bin:/sbin:/usr/bin:/usr/sbin
PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/usr/games

MANWIDTH=80

HISTSIZE=15000
HISTFILESIZE=2000

LSCOLORS="Ex"

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
#TERM=xterm

BLOCKSIZE="K"
EDITOR="/usr/local/bin/vim"
PAGER="less"

# Make SSH's auth socket predictable
if [ -n "${SSH_AUTH_SOCK}" ]
then
    if [ "${SSH_AUTH_SOCK}" != ~/.ssh/auth_sock ]
    then
        if ln -sf "${SSH_AUTH_SOCK}" ~/.ssh/auth_sock
        then
            SSH_AUTH_SOCK=~/.ssh/auth_sock
        fi
    fi
fi

export PATH MANWIDTH LSCOLORS HISTSIZE HISTFILESIZE
export BLOCKSIZE EDITOR PAGER

# Define some colours for PS prompts
norm  () { echo -n "\033[0m" ; }
red   () { echo -n "\033[0;31m" ; }
green () { echo -n "\033[0;32m" ; }
bold_norm () { echo -n "\033[1;32m" ; }

# Set the prompt
if [ $(id -u) == 0 ]
then
    PS1="$(red)\u@\h:$(norm) \W \$ "
else
    PS1="$(bold_norm)\u@\h:$(norm) \W \$ "
fi

if [ -x /usr/local/bin/vim ]
then
    alias vi='/usr/local/bin/vim'
fi

alias ls='ls -G'
alias l='ls -la'
alias ll='ls -l'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='env TERM=screen-256color tmux'

# If we're not already running under tmux try to attach
# to any running sessions
if [ -z "${TMUX}" ]
then
    # interactive shell displays daily quote
    case "$-" in
        *i*)
            if [ ! -f ~/.hushlogin -a -x /usr/games/fortune ]
            then
                /usr/games/fortune freebsd-tips
            fi
        ;;
    esac
    if [ ${TERM} != "screen" ]
    then
        tmux attach > /dev/null 2>&1
    fi
fi
