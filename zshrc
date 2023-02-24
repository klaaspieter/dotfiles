if type brew &>/dev/null; then
  source $(brew --prefix)/opt/spaceship/spaceship.zsh
else
  source "$HOME/.local/state/zsh/spaceship/spaceship.zsh"
fi

export SSH_AUTH_SOCK=~/.1password/agent.sock

export VISUAL="nvim"
export EDITOR="$VISUAL"

alias vim=nvim
alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"
alias g="git"
alias gs="git status"
