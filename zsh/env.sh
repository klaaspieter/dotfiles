export EDITOR='vim'
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
  export GPG_TTY=$(tty)
else
  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi
export GPGKEY=62C3F535
