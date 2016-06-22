" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

set number " line numbers
set expandtab
set noshowmode
set laststatus=2
set backupcopy=yes " saving strategy for files for better file watching
set backspace=2 " make backspace work like most other apps"
set clipboard=unnamed " allow yanks/cuts to go to system clipboard
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules,*.DS_Store
set timeoutlen=300 ttimeoutlen=0
syntax on
filetype plugin indent on

" Set escape mapping
imap jj <Esc>

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/scrooloose/syntastic.git'
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'terryma/vim-multiple-cursors'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/guns/xterm-color-table.vim'
Plug 'itchyny/lightline.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ajh17/VimCompletesMe'
Plug 'Chiel92/vim-autoformat', { 'for': ['javascript', 'json', 'javascript.jsx'] }
Plug 'terryma/vim-instant-markdown', { 'for': ['markdown'] }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'sjl/vitality.vim'
Plug 'wincent/vim-clipper'
call plug#end()

" PLUGIN OPTIONS
let g:ctrlp_working_path_mode = 'w'

let g:delimitMate_expand_cr= 2

" Vim Move
nnoremap mj :m .+1<cr>
nnoremap mk :m .-2<cr>

let g:indentLine_color_term = 237
let g:indentLine_enabled = 1
let g:vim_json_syntax_conceal = 0

let g:jsx_ext_required = 0

let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['fugitive', 'filename', 'modified']] },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'fugitive': 'LightLineFugitive' },
      \ 'colorscheme': 'solarized',
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return "-"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
    return ''
endfunction

" Solarized Theme Settings
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" Block cursor on NORMAL mode, thin cursor on INSERT mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" 80 Character Ruler, highlights characters
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
highlight ColorColumn ctermbg=magenta "set to whatever you like
call matchadd('ColorColumn', '\%81v', 80) "set column nr

" LEADERS
let mapleader = "\<Space>"
nnoremap <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>nt :NERDTreeFocus<cr>
nnoremap <Leader>t :CtrlP<cr>
nnoremap <Leader>af :Autoformat<cr>
nnoremap <Leader>h :wincmd h<cr>
nnoremap <Leader>j :wincmd j<cr>
nnoremap <Leader>k :wincmd k<cr>
nnoremap <Leader>l :wincmd l<cr>

" Easier pasting with paste mode
nnoremap <Leader>p :set paste!<cr>
