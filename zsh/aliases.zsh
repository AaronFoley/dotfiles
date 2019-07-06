# Programs
alias ls="/bin/ls -hlap --file-type --time-style='+%y-%m-%d %H%M%S' --color=auto --group-directories-first"
alias subl='subl3'
alias grep='grep --color=auto'

# No Clobbering
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'

# Make All dirs ..
alias mkdir='mkdir -p'

# Sudo
alias sudo='nocorrect sudo'
alias fucking="sudo"
alias please='sudo'
alias sorry='sudo $(history -p !-1)'

alias kc='kubectl'
