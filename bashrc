# shellcheck disable=SC2148,SC1091,SC2155
alias ll='ls -alG'
alias sudo='sudo -E HOME=$HOME'

# bash completion
if [ -f "/usr/local/etc/profile.d/bash_completion.sh" ];then
    source "/usr/local/etc/profile.d/bash_completion.sh";
elif [ -f "/usr/share/bash-completion/bash_completion" ]; then
    source "/usr/share/bash-completion/bash_completion"
elif [ -f "/etc/bash_completion" ]; then
    source "/etc/bash_completion"
fi

if [ -d "/Users/drunkbatya/Library/Python/3.8/bin" ];then
    PATH="$PATH:/Users/drunkbatya/Library/Python/3.8/bin";
fi

# check root and set $SIGN
if [ "$EUID" == 0 ];then
    SIGN="\[\033[1;31m\]#\[$(tput sgr0)\]";
else
    SIGN="$";
fi

# for vim-42header
export USER=$LOGNAME
export MAIL=drunkbatya.js@gmail.com #hardcode TODO: remove

# custom PS1 var
if [ -x "/usr/bin/tput" ] && tput setaf 1 >&/dev/null; then
    export PS1="\[$(tput sgr0)\]\[\033[1;31m\]\h\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]$SIGN ";
else
    export PS1="\h[\w]: $SIGN "
fi

# locale
LANG=en_US.utf-8
LC_ALL=en_US.utf-8

# options
shopt -s checkwinsize
shopt -s histappend

# editor
export EDITOR=vim
