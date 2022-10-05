#!/bin/sh

set -eu;

backup_file()
{
    if [ ! -f "$1" ]; then
        return;
    fi
    if [ ! -f "$1.bak" ]; then
        mv "$1" "$1.bak";
        return;
    fi
    COUNT=1;
    while [ -f "$1.bak$COUNT" ]; do
        COUNT=$((COUNT+1));
    done
    mv "$1" "$1.bak$COUNT";
}

downloader()
{
    echo "Installing $(basename "$1") ..";
    backup_file "$1";
    if ! curl --version > /dev/null 2>&1; then
        if ! wget --version > /dev/null 2>&1; then
            echo "Install curl or wget first";
            exit 2;
        fi
        wget -qO "$1" "$2";
        return 0;
    fi
    curl -SsLo "$1" "$2";
    return 0;
}

mkdir -p "$HOME/.vim/"{colors,autoload};
downloader "$HOME/.vim/colors/jellybeans.vim" \
    "https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim";
downloader "$HOME/.vim/autoload/plug.vim" \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim";
downloader "$HOME/.vimrc" \
    "https://raw.githubusercontent.com/drunkbatya/home/main/vimrc";
downloader "$HOME/.bashrc" \
    "https://raw.githubusercontent.com/drunkbatya/home/main/bashrc";
downloader "$HOME/.git-completion.bash" \
    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash";

