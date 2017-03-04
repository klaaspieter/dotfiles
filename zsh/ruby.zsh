source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

chruby 2.3.3

alias be="bundle exec"
alias b="bundle install -j4"
alias rr="mkdir -p tmp && touch tmp/restart.txt"
alias fs="foreman start"
alias link="powder link"
alias unlink="powder unlink"
