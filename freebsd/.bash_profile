# ~/.bash_profile executed by bash(1) for login shells.

if [ -f ~/.profile ] ; then
    . ~/.profile
fi

shopt -s checkwinsize
shopt -s histappend

HISTCONTROL=ignoreboth
LSCOLORS="Exfxcxdxbxegedabagacad"
