if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

eval "$(starship init zsh)"

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export DO_NOT_TRACK=true
export GH_TELEMETRY=false

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export SSH_AUTH_SOCK=~/.1password/agent.sock

export VISUAL="nvim"
export EDITOR="$VISUAL"

# Workaround for opencode light mode code block rendering bug
# https://github.com/anomalyco/opencode/issues/16470
export OPENCODE_EXPERIMENTAL_MARKDOWN=false

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
export EZA_COLORS="di=1;34:bu=36:do=36"
alias ls="eza"
alias ll="eza --long --git"
alias la="eza --long --git --all"
alias be="bundle exec"

# direnv
eval "$(direnv hook zsh)"

# jj
source <(COMPLETE=zsh jj)

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

# shellcheck source=/dev/null
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
