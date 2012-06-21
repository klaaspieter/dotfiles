ulimit -n 1024
DULL=0
BRIGHT=1

FG_RED=31
FG_WHITE=37
BG_NULL=00

ESC="\033"
NORMAL="\[$ESC[m\]"
RESET="\[$ESC[${DULL};${FG_WHITE};${BG_NULL}m\]"
RED="\[$ESC[${DULL};${FG_RED}m\]"

alias t='todo.sh'
source ~/.todo-completion.bash
complete -F _todo t

source ~/.git-completion.bash

PS1='\h:\W'${RED}'$(__git_ps1 "@%s")'${RESET}'\$ '

alias g='git'
# Make the autocompleton work with the g alias
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
|| complete -o default -o nospace -F _git g

export PATH="/usr/local/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/usr/local/narwhal/bin:$PATH"
export NARWHAL_ENGINE=jsc
export CAPP_BUILD="/Users/klaaspieter/Developer/Objective-J/cappuccino/Build"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
