alias reload="source ~/.zshrc; echo 'sourced ~/.zshrc'"

alias g="git"
alias gs="git status"
alias gdf="git difftool"

alias ll="ls -lh"

alias p="pod install"

alias xcnuke="rm -rf ~/Library/Developer/Xcode/DerivedData"
alias xccleanup="xcrun simctl delete unavailable"
alias canuke="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' |awk '{print $1}'`"

alias cask="brew cask"

alias seed-env=". seed-env"

alias journal='vim "$JOURNAL"/$(date "+%Y%m%d-%H%M%S").md'
