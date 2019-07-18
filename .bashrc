   1 # ~/.bashrc: executed by bash(1) for non-login shells.
  2 # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
  3 # for examples
  4 
  5 # If not running interactively, don't do anything
  6 case $- in
  7     *i*) ;;
  8       *) return;;
  9 esac
 10 
 11 # don't put duplicate lines or lines starting with space in the history.
 12 # See bash(1) for more options
 13 HISTCONTROL=ignoreboth
 14 
 15 # append to the history file, don't overwrite it
 16 shopt -s histappend
 17 
 18 # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
 19 HISTSIZE=1000
 20 HISTFILESIZE=2000
 21 
 22 # check the window size after each command and, if necessary,
 23 # update the values of LINES and COLUMNS.
 24 shopt -s checkwinsize
 25 
 26 # If set, the pattern "**" used in a pathname expansion context will
 27 # match all files and zero or more directories and subdirectories.
 28 #shopt -s globstar
 29 
 30 # make less more friendly for non-text input files, see lesspipe(1)
 31 [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
 32 
 33 # set variable identifying the chroot you work in (used in the prompt below)
 34 if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
 35     debian_chroot=$(cat /etc/debian_chroot)
 36 fi
 37 
 38 # set a fancy prompt (non-color, unless we know we "want" color)
 39 case "$TERM" in
 40     xterm-color|*-256color) color_prompt=yes;;
 41 esac
 42 
 43 # uncomment for a colored prompt, if the terminal has the capability; turned
 44 # off by default to not distract the user: the focus in a terminal window
 45 # should be on the output of commands, not on the prompt
 46 #force_color_prompt=yes
 47 
 48 if [ -n "$force_color_prompt" ]; then
 49     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
 50     # We have color support; assume it's compliant with Ecma-48
 51     # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
 52     # a case would tend to support setf rather than setaf.)
 53     color_prompt=yes
 54     else
 55     color_prompt=
 56     fi
 57 fi
 58
 59 if [ "$color_prompt" = yes ]; then
 60     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 61 else
 62     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
 63 fi
 64 unset color_prompt force_color_prompt
 65 
 66 # If this is an xterm set the title to user@host:dir
 67 case "$TERM" in
 68 xterm*|rxvt*)
 69     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
 70     ;;
 71 *)
 72     ;;
 73 esac
 74 
 75 # enable color support of ls and also add handy aliases
 76 if [ -x /usr/bin/dircolors ]; then
 77     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
 78     alias ls='ls --color=auto'
 79     #alias dir='dir --color=auto'
 80     #alias vdir='vdir --color=auto'
 81 
 82     alias grep='grep --color=auto'
 83     alias fgrep='fgrep --color=auto'
 84     alias egrep='egrep --color=auto'
 85 fi
 86 
 87 # colored GCC warnings and errors
 88 #export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
 89 
 90 # some more ls aliases
 91 alias ll='ls -alF'
 92 alias la='ls -A'
 93 alias l='ls -CF'
 94 
 95 # Add an "alert" alias for long running commands.  Use like so:
 96 #   sleep 10; alert
 97 alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
 98 
 99 # Alias definitions.
100 # You may want to put all your additions into a separate file like
101 # ~/.bash_aliases, instead of adding them here directly.
102 # See /usr/share/doc/bash-doc/examples in the bash-doc package.
103 
104 if [ -f ~/.bash_aliases ]; then
105     . ~/.bash_aliases
106 fi
107 
108 # enable programmable completion features (you don't need to enable
109 # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
110 # sources /etc/bash.bashrc).
111 if ! shopt -oq posix; then
112   if [ -f /usr/share/bash-completion/bash_completion ]; then
113     . /usr/share/bash-completion/bash_completion
114   elif [ -f /etc/bash_completion ]; then
115     . /etc/bash_completion
116   fi
117 fi
.bashrc                                                                                                                                                                                                                   117,1          Bot
Type  :qa!  and press <Enter> to abandon all changes and exit Vim
