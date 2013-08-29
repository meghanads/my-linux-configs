# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions:
PS1="\[\033[1;34m\][\$(date +%H%M)]\[\033[1;35m\]MS: \[\033[1;34m\]\W $\[\033[0m\] "

# User specific aliases and functions
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias agi='sudo apt-get install'
