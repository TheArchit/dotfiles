# ~/.bash_profile executed by bash(1) for login shells.

if [ -f ~/.profile ] ; then
    . ~/.profile
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
  . /opt/local/etc/profile.d/bash_completion.sh
fi

shopt -s checkwinsize
shopt -s histappend

HISTCONTROL="ignoreboth"
