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
  echo " $DIRTY_COLOR${ref#refs/heads/}$(git_stash_info)$f"
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

# Shows current working directory (up to 5 levels) in blue
# Git branch in red if dirty, otherwise green.
PROMPT='%F{blue}%(6~|%-1~/.../%4~|%5~)%f%F{red}$(git_prompt_info)%f '

# %(5~|%-1~/…/%3~|%4~)

# Shows last return status in red if not zero
RPROMPT="${status_code_prompt_info}"
