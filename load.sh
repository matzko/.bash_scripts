source ~/.bash_scripts/git-completion.sh

# colors with git repo info
PS1='\[\033[31m\](\u)\[\033[0m\] $\h:\w\[\033[32m\]$(__git_ps1) \[\033[0m\]# '

export TERM=xterm-256color
