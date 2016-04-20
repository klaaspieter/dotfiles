setopt PROMPT_SUBST

function git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  local DIRTY_COLOR
  if parse_git_dirty; then
    DIRTY_COLOR="%F{red}"
  else
    DIRTY_COLOR="%F{green}"
  fi
  echo " $DIRTY_COLOR${ref#refs/heads/}$f"
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

function status_code_prompt_info() {
  echo "%F{red}%(?..%?)$f"
}


# Show the vim mode in the right PROMPT
function zle-line-init zle-keymap-select {
  VIM_PROMPT="[% NORMAL]% "
  RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(status_code_prompt_info) $EPS1"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Shows current working directory (up to 3 levels) in blue
# Git branch in red if dirty, otherwise green.
PROMPT='%F{blue}%3~%f%F{red}$(git_prompt_info)%f '

# Shows last return status in red if not zero
RPROMPT="${status_code_prompt_info}"
