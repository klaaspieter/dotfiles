alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"

alias g="git"
alias git="nocorrect git"
alias gs="git status"
alias gdf="git difftool"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

alias ll="ls -lh"

alias b="bundle install -j4"
alias c="rake console"
alias rr="mkdir -p tmp && touch tmp/restart.txt"
alias fs="foreman start"

alias link="powder link"
alias unlink="powder unlink"

alias p="pod install"
alias bp="bundle exec pod install"
alias nuke="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias sl="git diff --name-only master | xargs swiftlint lint --path"
