# ============================================================================
# Path
# ============================================================================
path=(
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  "$HOME/.bin"
  "$GOBIN"
)
[ -d "$HOME/.dotfiles-private/bin" ] && path+=("$HOME/.dotfiles-private/bin")

# ============================================================================
# Global
# ============================================================================
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Use emacs mode
bindkey -e

# ============================================================================
# Options
# ============================================================================
setopt no_beep

# Try to correct misspelled commands
setopt CORRECT
# Require exit or logout to exit a shell
setopt IGNORE_EOF
# Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename
# generation
setopt EXTENDED_GLOB

# ============================================================================
# Completion
# ============================================================================
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
FPATH=~/.zsh/completion:$FPATH

autoload -Uz compinit
compinit -i

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Hack to get pass-insert-qr and pass-show-qr to use pass' default completions
compdef _pass_complete_entries pass-show-qr
compdef _pass_complete_entries_with_subdirs pass-insert-qr

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ============================================================================
# Keybindings
# ============================================================================
# From man stty
# Enable (disable) START/STOP output control. Output from the system is
# stopped when the system receives STOP and started when the system
# receives START, or if ixany is set, any character restarts output.
#
# By default START/STOP are bound to ^S and ^Q conflicting with default zsh
# mappings.
stty -ixon

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# ============================================================================
# Navigation
# ============================================================================
setopt auto_cd
cdpath=($HOME $PROJECTS)

# Exporting CDPATH is bad and can cause all sorts of problems so lets set
# CDPATH to something else and export that instead
export JUMP_DIRECTORIES=$CDPATH

# ============================================================================
# Tools
# ============================================================================
export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"

export BROWSER="browser"
export NVIM_LISTEN_ADDRESS="/tmp/nvim"

# ============================================================================
# History
# ============================================================================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt no_hist_beep

# ============================================================================
# Aliases
# ============================================================================

# ======
# ZSH
# ======
alias reload="source ~/.zshenv && source ~/.zshrc; echo 'sourced ~/.zshrc'"

# ======
# Editor
# ======
alias e=$VISUAL
alias vim=$EDITOR

# ======
# Git
# ======
alias g="git"
alias gs="git status"
alias gdf="git difftool"

# ======
# Cocoapods
# ======
alias p="pod install"

# ======
# Ruby
# ======
alias be="bundle exec"
alias b="bundle install -j4"

# ======
# Misc
# ======

# Clear the screen in tmux
alias cls=clear;tmux clear-history;

# Kill CoreAudio. Use this when volume controls stop working
alias canuke="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"

# ============================================================================
# Appearance
# ============================================================================
if [ $(uname -s) = "Darwin" ]; then
  style=$(defaults read -g AppleInterfaceStyle 2> /dev/null)
  if [ "$style" = "Dark" ]; then
    export THEME=dark
  else
    export THEME=light
  fi
fi

export CLICOLOR=true

# ======
# PROMPT
# ======
autoload -U colors && colors
setopt prompt_subst

git_branch_color() {
  if [ "$THEME" = "light" ]; then
    echo "%{$fg_bold[black]%}"
  elif [ "$THEME" = "dark" ]; then
    echo "%{$fg_bold[white]%}"
  else
    echo "%{$fg_bold[black]%}"
  fi
}

function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  local DIRTY_COLOR
  if parse_git_dirty; then
    DIRTY_COLOR="$(git_branch_color)"
  else
    DIRTY_COLOR="%{$reset_color%}"
  fi
  echo " ${DIRTY_COLOR}${ref#refs/heads/}$(git_stash_info)"
}

function git_stash_info() {
  stash_file="$( git rev-parse --git-dir )/logs/refs/stash"
  if [[ -e "${stash_file}" ]]; then
    while IFS='' read -r wcline || [[ -n "$wcline" ]]; do
      ((num_stashed++))
    done < ${stash_file}
  fi

  if (( num_stashed > 0 )); then
    printf " ⚑$num_stashed"
  fi
}

function parse_git_dirty() {
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

  if [[ -n $STATUS ]]; then
    return 0
  else
    return 1
  fi
}

function xcode_version_prompt_info() {
  if [ -n "${XCODE_AUTO_VERSION+x}" ]; then
    echo "🔨 $XCODE_AUTO_VERSION"
  fi
}

function status_code_prompt_info() {
  echo "%(?..%?)"
}

# Shows current working directory (up to 5 levels) in blue
# Git branch in red if dirty, otherwise green.
PROMPT='%(6~|%-1~/.../%2~|%5~)$(git_prompt_info) %{$reset_color%}%'

# Shows last return status in red if not zero
RPROMPT='$(xcode_version_prompt_info) $(status_code_prompt_info)'

# ============================================================================
# ASDF
# ============================================================================
source $HOME/.asdf/asdf.sh
source "$HOME/.asdf/completions/asdf.bash"

# ============================================================================
# bat
# ============================================================================
export BAT_THEME="gruvbox-dark"

# ============================================================================
# chxcode
# ============================================================================
source /usr/local/opt/chxcode/share/chxcode/chxcode
source /usr/local/opt/chxcode/share/chxcode/auto

# ============================================================================
# Zoxide
# ============================================================================
eval "$(zoxide init zsh)"

# ============================================================================
# Fastlane
# ============================================================================
export XCODE_INSTALL_USER=kp@annema.me

# ============================================================================
# Elixir
# ============================================================================
export ERL_AFLAGS="-kernel shell_history enabled"

# ============================================================================
# Go
# ============================================================================
export GOPATH=$HOME/Developer/golang
export GOBIN=$GOPATH/bin
export GOPRIVATE=github.com/sketch-hq

# ============================================================================
# dotenv
# ============================================================================
source_env() {
  if [[ -f .env ]]; then
    source .env
  fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_env

# ============================================================================
# GPG
# ============================================================================
GPG_TTY=$(tty)
export GPG_TTY
export GPGKEY=62C3F535
gpgconf --launch gpg-agent

# ============================================================================
# SSH
# ============================================================================
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK

# Ensure SSH using a GPG key knows where to show pinentry
# https://www.gnupg.org/documentation/manuals/gnupg/Common-Problems.html
echo "UPDATESTARTUPTTY" | gpg-connect-agent > /dev/null 2>&1

# ============================================================================
# pass
# ============================================================================
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR=/usr/local/lib/password-store/extensions

# ============================================================================
# direnv
# ============================================================================
eval "$(asdf exec direnv hook zsh)"

# A shortcut for asdf managed direnv
direnv() { asdf exec direnv "$@"; }

# ============================================================================
# starship
# ============================================================================
eval "$(starship init zsh)"

# ============================================================================
# Local
# ============================================================================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
