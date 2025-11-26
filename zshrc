if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

eval "$(starship init zsh)"

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
alias clp="CLAUDE_CONFIG_DIR=~/.config/claude/personal claude"
alias clw="CLAUDE_CONFIG_DIR=~/.config/claude/ipinfo claude"

# direnv
eval "$(direnv hook zsh)"

# Android
path+=("$HOME/.bin" "/Applications/Android Studio.app/Contents/MacOS")
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home/"

# bun completions
[ -s "/Users/kp/.bun/_bun" ] && source "/Users/kp/.bun/_bun"

eval "$(zoxide init zsh)"

# Add Google cloud SDK to PATH
if [ -f '/Users/kp/Developer/clones/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kp/Developer/clones/google-cloud-sdk/path.zsh.inc'; fi

# Enable completions for Google cloud SDK
if [ -f '/Users/kp/Developer/clones/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kp/Developer/clones/google-cloud-sdk/completion.zsh.inc'; fi

MISE_ENV_FILE=".env"
eval "$(/Users/kp/.local/bin/mise activate zsh)"

# zsh shell integration
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

source <(fzf --zsh)
source ~/.fzf-git.sh
