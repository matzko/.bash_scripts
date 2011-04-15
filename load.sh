source ~/.bash_scripts/git-completion.sh

# colors with git repo info
# test for root
if [ $(id -u) -eq 0 ];
then
	PS1='\[\033[31m\](\u)\[\033[0m\] $\h:\w\[\033[32m\]$(__git_ps1) \[\033[0m\]# '
else
	PS1='\h:\w\[\033[32m\]$(__git_ps1) \[\033[0m\]$ '
fi

export TERM=xterm-256color
