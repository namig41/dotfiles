call plug#begin('~/.vim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' } 
    Plug 'flrnd/candid.vim' 
    Plug 'vim-scripts/vim-auto-save'
    Plug 'arzg/vim-substrata'
    Plug 'wincent/terminus'
    Plug 'cocopon/iceberg.vim'
    Plug 'romainl/Apprentice'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'matze/vim-move'
	Plug 'mkitt/tabline.vim'
call plug#end()

syntax on
set autoread
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
set wrap
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set tabstop=4
set shiftwidth=4
set smartcase
set smartindent
set smarttab
set visualbell
set noswapfile
set ruler

colorscheme iceberg 

function! InsertTabWrapper(direction)
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
elseif "backward" == a:direction
    return "\<c-p>"
else
    return "\<c-n>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr> 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap ff <Esc>

let g:auto_save = 1
autocmd InsertEnter,InsertLeave * set cul!

let g:multi_cursor_quit_key = '<f><f>'
let g:move_key_modifier = 'C'

