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

HISTSIZE=50000
# shellcheck disable=SC2034
SAVEHIST="${HISTSIZE}"

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
# shellcheck source=/dev/null
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

eval "$(zoxide init zsh)"

GOOGLE_CLOUD_SDK_PATH="$HOME/Developer/clones/google-cloud-sdk"

# Add Google cloud SDK to PATH
# shellcheck source=/dev/null
if [ -f "$GOOGLE_CLOUD_SDK_PATH/path.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK_PATH/path.zsh.inc"; fi

# Enable completions for Google cloud SDK
# shellcheck source=/dev/null
if [ -f "$GOOGLE_CLOUD_SDK_PATH/completion.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK_PATH/completion.zsh.inc"; fi

export MISE_ENV_FILE=".env"
eval "$(mise activate zsh)"

# shellcheck source=/dev/null
source <(fzf --zsh)

# shellcheck source=/dev/null
source ~/.fzf-git.sh
