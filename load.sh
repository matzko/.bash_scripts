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

# source "/usr/share/rvm/scripts/rvm"

# export TERM=xterm-256color

set -o vi

alias elm='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID -p 8000:8000 matzko/elm_tools elm'
alias elm-generate='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID matzko/elm_tools elm-generate'
alias elm-analyse='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID matzko/elm_tools elm-analyse'
alias npm='docker run -it --rm -v "$(pwd):/code" -v "/tmp:/tmp" -w "/code" -e "HOME=/tmp" -u $UID:$GID matzko/elm_tools npm'
alias create-elm-app='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID matzko/elm_tools create-elm-app'
alias elm-app='docker run -it --rm -v "$(pwd):/code" -w "/code" -e "HOME=/tmp" -u $UID:$GID matzko/elm_tools elm-app'
PATH=~/.bash_scripts/bin:$PATH
