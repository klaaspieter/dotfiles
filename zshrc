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
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

alias vim=nvim
alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"
alias g="git"
alias gs="git status"

# direnv
eval "$(direnv hook zsh)"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home/"
path+=("$HOME/.bin" "/Applications/Android Studio.app/Contents/MacOS" "$ANDROID_HOME/platform-tools")

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

eval "$(zoxide init zsh)"

# Add Google cloud SDK to PATH
GOOGLE_CLOUD_SDK_PATH="$HOME/Developer/clones/google-cloud-sdk"
if [ -f "$GOOGLE_CLOUD_SDK_PATH/path.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK_PATH/path.zsh.inc"; fi

# Enable completions for Google cloud SDK
if [ -f "$GOOGLE_CLOUD_SDK_PATH/completion.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK_PATH/completion.zsh.inc"; fi

MISE_ENV_FILE=".env"
eval "$(mise activate zsh)"

# zsh shell integration
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

source <(fzf --zsh)
source ~/.fzf-git.sh
