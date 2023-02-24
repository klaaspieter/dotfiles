if type brew &>/dev/null; then
  source $(brew --prefix)/opt/spaceship/spaceship.zsh
else
  source "$HOME/.local/state/zsh/spaceship/spaceship.zsh"
fi

alias vim=nvim
alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"
alias g="git"
alias gs="git status"
