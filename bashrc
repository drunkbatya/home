alias ll='ls -alG'
alias sudo='sudo -E HOME=$HOME'

if [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]]; then
    source "/opt/homebrew/etc/profile.d/bash_completion.sh";
fi
if [[ -r "~/.flipper/insfrastructure-misc.sh" ]]; then
    source "~/.flipper/insfrastructure-misc.sh";
fi
if [[ -r "~/.git-completion.bash" ]]; then
    source "~/.git-completion.bash";
fi
if which kubectl; then
    source <(kubectl completion bash);
fi

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
