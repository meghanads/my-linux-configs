# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source local definitions:
PS1="\[\033[1;34m\][\$(date +%H%M)]\[\033[1;35m\]MS: \[\033[1;34m\]\W $\[\033[0m\] "

# User specific aliases and functions
alias ll='ls -l'
alias la='ls -a'
alias l='ls'
