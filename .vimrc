call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
call plug#end()

set backspace=2 "
set tabstop=2
set shiftwidth=2
set expandtab

" Escape
:imap jj <Esc>

" Syntax Colors
syntax enable
set background=dark
colorscheme solarized
