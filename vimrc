set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

" to set 'filetype' in files
set modeline
set modelines=2

" highlighting all search matches
set hlsearch

silent! call plug#begin('~/.vim/bundle')
Plug 'rodjek/vim-puppet'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'chr4/nginx.vim'
Plug 'hashivim/vim-terraform'
call plug#end()

set laststatus=2
au FileType puppet setl sw=4 sts=4 et
au FileType yaml setl ts=2 sts=2 sw=2 et

colorscheme jellybeans
