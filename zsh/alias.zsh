alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"

alias g="git"
alias gs="git status"
alias gdf="git difftool"

alias ll="ls -lh"

alias p="pod install"
alias nuke="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias sl="git diff --name-only master | ack \".swift\" | xargs -L1 swiftlint lint --path 2>/dev/null"