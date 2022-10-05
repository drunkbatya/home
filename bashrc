alias ll='ls -alG'
alias sudo='sudo -E HOME=$HOME'

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

source ~/.flipper/insfrastructure-misc.sh
source ~/.git-completion.bash
source <(kubectl completion bash)

# check root and set $SIGN
if [ "$EUID" == 0 ];then
    SIGN="\[\033[1;31m\]#\[$(tput sgr0)\]";
else
    SIGN="$";
fi

# custom PS1 var
if [ -x "/usr/bin/tput" ] && tput setaf 1 >&/dev/null; then
    export PS1="\[$(tput sgr0)\]\[\033[1;31m\]\h\[\033[38;5;6m\][\w]\[$(tput sgr0)\]: \[$(tput sgr0)\]$SIGN ";
else
    export PS1="\h[\w]: $SIGN "
fi
