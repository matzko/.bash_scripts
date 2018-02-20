source ~/.bash_scripts/git-completion.sh
source ~/.bash_scripts/git-flow-completion.bash
source ~/.bash_scripts/todo_completion
alias t="todo.sh"
complete -F _todo t

# use vim as the default editor
export VISUAL=vim
export EDITOR=vim

# keep iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# colors with git repo info
# test for root
if [ $(id -u) -eq 0 ];
then
	PS1='\[\033[31m\](\u)\[\033[0m\] $\h:\w\[\033[32m\]$(__git_ps1) \[\033[0m\]# '
else
	PS1='\h:\w\[\033[32m\]$(__git_ps1) \[\033[0m\]$ '
fi

# export TERM=xterm-256color

set -o vi
