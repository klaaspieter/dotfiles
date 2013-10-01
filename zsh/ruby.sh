#Add the following to the ~/.bashrc or ~/.zshrc file:
#
source /usr/local/opt/chruby/share/chruby/chruby.sh
#
#By default chruby will search for Rubies installed into /opt/rubies/ or
#~/.rubies/. For non-standard installation locations, simply set the RUBIES
#variable:
#
#  RUBIES=(
#    /opt/jruby-1.7.0
#    $HOME/src/rubinius
#  )
#
#If you are migrating from another Ruby manager, set `RUBIES` accordingly:
#
#  RVM:   RUBIES=(~/.rvm/rubies/*)
#  rbenv: RUBIES=(~/.rbenv/versions/*)
#  rbfu:  RUBIES=(~/.rbfu/rubies/*)
#
#To enable auto-switching of Rubies specified by .ruby-version files,
#add the following to ~/.bashrc or ~/.zshrc:
#
source /usr/local/opt/chruby/share/chruby/auto.sh

# Set the default ruby, auto swithcing doesn't work on encrytped disk images
chruby ruby-2.0
