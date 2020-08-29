call plug#begin('~/.vim/plugged')
    Plug 'flrnd/candid.vim' 
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'arzg/vim-substrata'
	Plug 'cocopon/iceberg.vim'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'fwincent/terminus'
    Plug 'jiangmiao/auto-pairs'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'matze/vim-move'
	Plug 'mkitt/tabline.vim'
	Plug 'itchyny/vim-cursorword'
	Plug 'preservim/nerdtree'
call plug#end()

syntax on
set background=dark
set termguicolors
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

colorscheme dracula

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
imap jk <Esc>

nmap T :NERDTree<CR>

let g:auto_save = 1
let g:multi_cursor_quit_key = '<f><f>'
let g:move_key_modifier = 'C'

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[3 q'" 
