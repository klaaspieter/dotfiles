__prompt_command() {
  local vcs base_dir sub_dir ref last_command
  sub_dir() {
    local sub_dir
    sub_dir=$(stat -f "${PWD}")
    sub_dir=${sub_dir#$1}
    echo ${sub_dir#/}
  }

  # http://github.com/blog/297-dirty-git-state-in-your-prompt
  function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
  }

  function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
  }

  git_dir() {
    base_dir=$(git rev-parse --show-cdup 2>/dev/null) || return 1
    if [ -n "$base_dir" ]; then
      base_dir=`cd $base_dir; pwd`
    else
      base_dir=$PWD
    fi
    sub_dir=$(git rev-parse --show-prefix)
    sub_dir="/${sub_dir%/}"
    ref=$(parse_git_branch)
    vcs="git"
    alias pull="git pull"
    alias commit="git commit -v -a"
    alias push="commit ; git push"
    alias revert="git checkout"
  }

  svn_dir() {
    [ -d ".svn" ] || return 1
    base_dir="."
    while [ -d "$base_dir/../.svn" ]; do base_dir="$base_dir/.."; done
    base_dir=`cd $base_dir; pwd`
    sub_dir="/$(sub_dir "${base_dir}")"
    ref=`svnversion`
    vcs="svn"
    alias pull="svn up"
    alias commit="svn commit"
    alias push="svn ci"
    alias revert="svn revert"
  }

  bzr_dir() {
    base_dir=$(bzr root 2>/dev/null) || return 1
    if [ -n "$base_dir" ]; then
      base_dir=`cd $base_dir; pwd`
    else
      base_dir=$PWD
    fi
    sub_dir="/$(sub_dir "${base_dir}")"
    ref=$(bzr revno 2>/dev/null)
    vcs="bzr"
    alias pull="bzr pull"
    alias commit="bzr commit"
    alias push="bzr push"
    alias revert="bzr revert"
  }

  git_dir || svn_dir || bzr_dir

  if [ -n "$vcs" ]; then
    alias st="$vcs status"
    alias d="$vcs diff"
    alias up="pull"
    alias cdb="cd $base_dir"
    base_dir="$(basename "${base_dir}")"
    working_on="$base_dir:"
    __vcs_prefix="($vcs)"
    __vcs_ref="[$ref]"
    __vcs_sub_dir="${sub_dir}"
    __vcs_base_dir="${base_dir/$HOME/~}"
  else
    __vcs_prefix=':'
    __vcs_base_dir="${PWD/$HOME/~}"
    __vcs_ref=''
    __vcs_sub_dir=''
    working_on=""
  fi

  last_command=$(history 1 | sed -e "s/^[ ]*[0-9]*[ ]*//g")
  __tab_title="$working_on[$last_command]"
  __pretty_pwd="${PWD/$HOME/~}"
}

PROMPT_COMMAND=__prompt_command

if [ "`id -u`" = "0" ]; then
  export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]\[\e[0;35m\]$__vcs_prefix\[\e[0m\]\[\e[0;34m\]${__vcs_base_dir}\[\e[0m\]\[\e[0;33m\]${__vcs_ref}\[\e[0m\]\[\e[0;34m\]${__vcs_sub_dir}\[\e[0m\]\$ '
else
  export PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]\[\e[0;35m\]$__vcs_prefix\[\e[0m\]\[\e[0;34m\]${__vcs_base_dir}\[\e[0m\]\[\e[0;33m\]${__vcs_ref}\[\e[0m\]\[\e[0;34m\]${__vcs_sub_dir}\[\e[0m\]\$ '
fi
