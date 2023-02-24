if [[ $OSTYPE == 'darwin'* ]]; then
  source $(brew --prefix)/opt/spaceship/spaceship.zsh
fi

alias vim=nvim
alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"
