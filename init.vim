set number
set relativenumber
set ru
set nohlsearch
set hidden
set tabstop=4 softtabstop=4
set shiftwidth=4
set noswapfile
set incsearch
set scrolloff=8
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
call plug#end()
set background=dark
colorscheme codedark
