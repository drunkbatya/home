set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start

# to set 'filetype' in files
set modeline
set modelines=2

silent! call plug#begin('~/.vim/bundle')
Plug 'rodjek/vim-puppet'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'pbonder/vim-42header'
Plug 'chr4/nginx.vim'
call plug#end()

set laststatus=2
au FileType puppet setl sw=4 sts=4 et
au FileType c setl ts=8 sw=8 sts=0 noexpandtab
au FileType cpp setl ts=8 sw=8 sts=0 noexpandtab

colorscheme jellybeans
