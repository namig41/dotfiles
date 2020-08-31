call plug#begin('~/.vim/plugged')
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'arcticicestudio/nord-vim'
	Plug 'cocopon/iceberg.vim'
	Plug 'vim-scripts/vim-auto-save'
	Plug 'wincent/terminus'
	Plug 'jiangmiao/auto-pairs'
	Plug 'matze/vim-move'
	Plug 'mkitt/tabline.vim'
	Plug 'itchyny/vim-cursorword'
	Plug 'preservim/nerdtree'
	Plug 'cocopon/iceberg.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'kshenoy/vim-signature'
call plug#end()

syntax on
set bg=dark
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

colorscheme nord

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
vmap jk <Esc>

nmap T :NERDTree<CR>
nmap t :FZF<CR>
nmap <c-f> :Files<CR>
nmap <c-p> :Ag<CR>

nmap K gt
nmap J gT


let g:auto_save = 1

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[3 q'" 

let g:move_key_modifier = 'C'

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
