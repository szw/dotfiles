# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

HISTIGNORE='ls:bg:fg:history:TMUX_EXECUTABLE=tmux tmux -2u:mc:exit'

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Update bash history in realtime (http://www.cuberick.com/2008/11/update-bash-history-in-realtime.html)
# append and reload:
# PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
# only append:
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\\[\\033[00m\\]:\\[\\033[35m\\]\1/')\[\033[00m\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Turn off XON/XOFF flow control (http://blog.sanctum.geek.nz/terminal-annoyances/)
stty -ixon


if [[ $PATH != *"$HOME/.rvm/bin"* ]]; then
    PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
fi

if [ $(uname -s) = "Darwin" ]; then
    export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
    alias ls='ls -G'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    export GOPATH=$HOME/Projects/Go

    if [[ $PATH != *"$GOPATH"* ]]; then
	export PATH=$PATH:$GOPATH/bin
    fi
else
    PATH=$HOME/.local/bin:$PATH
    export JAVA_HOME="/usr/lib/jvm/jdk"
    export PATH=$JAVA_HOME/bin:$PATH
fi

# export JAVA_OPTS="-XX:+TieredCompilation -client"
# export JRUBY_OPTS="--1.9 -X-C"
export JAVA_OPTS="-client"
export JRUBY_OPTS="--2.0"

# PROMPT_COMMAND="echo -ne \"\\033]0;\${USER}@${HOSTNAME}\\007\\033k\${PWD}\\033\\\\\"; $PROMPT_COMMAND"

# set_tmux_title(){ if [ "$PWD" != "$LPWD" ];then LPWD="$PWD"; tmux rename-window "${PWD//*\//} {pane_current_command}"; fi };

# case "$TERM" in
#     screen) export PROMPT_COMMAND="set_tmux_title; $PROMPT_COMMAND";;
#     screen-color) export PROMPT_COMMAND="set_tmux_title; $PROMPT_COMMAND";;
#     screen-256color) export PROMPT_COMMAND="set_tmux_title; $PROMPT_COMMAND";;
# esac

# export MC_SKIN=$HOME/.mc/solarized.ini

