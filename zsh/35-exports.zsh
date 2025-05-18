# Add User bin to the path
export PATH=${KREW_ROOT:-$HOME/.krew}/bin:~/bin:~/.local/bin:$PATH

# Setup default programs
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='nano'
export BROWSER='librewolf'

# Prevent annoying corrections
export CORRECT_IGNORE_FILE='.*'
