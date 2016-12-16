fpath=(~/.zsh/completions/ /usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

autoload -U compinit
compinit

compdef _pass_complete_entries pass-show-qr
compdef _pass_complete_entries_with_subdirs pass-insert-qr
