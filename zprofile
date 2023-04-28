if [[ $(uname) == "Darwin" ]]; then
  if [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -d  "/usr/local/Homebrew" ]]; then
    eval "$(/usr/local/Homebrew/bin/brew shellenv)"
  fi

  # Added by OrbStack: command-line tools and integration
  source ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi
