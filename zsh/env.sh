export TERM="xterm-256color"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export EDITOR="vim"
bindkey -e
export KEYTIMEOUT=1

GPG_TTY=$(tty)
export GPG_TTY

export GPGKEY=62C3F535
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent

# Ensure SSH using a GPG key knows where do show pinentry
# https://www.gnupg.org/documentation/manuals/gnupg/Common-Problems.html
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

export PROJECTS="$HOME/Developer/Projects"
export DROPBOX="$HOME/Dropbox (Personal)"
export JOURNAL="$DROPBOX/Journal"
export NOTES="$DROPBOX/Notes"

setopt auto_cd
cdpath=($HOME $PROJECTS $HOME/Developer/Seed)
export JUMP_DIRECTORIES=$CDPATH
