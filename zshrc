if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  source $(brew --prefix)/opt/spaceship/spaceship.zsh
else
  source "$HOME/.local/state/zsh/spaceship/spaceship.zsh"
fi

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export SSH_AUTH_SOCK=~/.1password/agent.sock

export VISUAL="nvim"
export EDITOR="$VISUAL"

setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

alias vim=nvim
alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"
alias g="git"
alias gs="git status"

# Android
path+=("$HOME/.bin" "/Applications/Android Studio.app/Contents/MacOS")
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home/"

# bun completions
[ -s "/Users/kp/.bun/_bun" ] && source "/Users/kp/.bun/_bun"

eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kp/Developer/clones/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kp/Developer/clones/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kp/Developer/clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kp/Developer/clones/google-cloud-sdk/completion.zsh.inc'; fi

MISE_ENV_FILE=".env"
eval "$(/Users/kp/.local/bin/mise activate zsh)"
