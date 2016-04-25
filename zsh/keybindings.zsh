# From man stty
# Enable (disable) START/STOP output control. Output from the system is
# stopped when the system receives STOP and started when the system
# receives START, or if ixany is set, any character restarts output.
#
# By default START/STOP are bound to ^S and ^Q conflicting with default zsh
# mappings.
stty -ixon
