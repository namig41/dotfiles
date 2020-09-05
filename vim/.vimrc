call plug#begin('~/.vim/plugged')
	Plug 'arcticicestudio/nord-vim'
	Plug 'cocopon/iceberg.vim'
	Plug 'vim-scripts/vim-auto-save'
	Plug 'wincent/terminus'
	Plug 'jiangmiao/auto-pairs'
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
	Plug 'ekalinin/Dockerfile.vim'
	Plug 'tpope/vim-surround'
	Plug 'easymotion/vim-easymotion'
	Plug 'szw/vim-tags'
	Plug 'tpope/vim-commentary'
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
set smartindent
set smarttab
set expandtab
set visualbell
set noswapfile
set ruler
set nohlsearch

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
vmap aa <Esc>

nmap T :NERDTree<CR>
nmap t :FZF<CR>
nmap <c-g> :Files<CR>
nmap <c-p> :Ag<CR>

nmap z %

nmap <Leader>r :TagsGenerate!<CR>

nmap K gt
nmap J gT

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

nmap <c-j> <c-d>
nmap <c-k> <c-u>

let g:auto_save = 1
let g:AutoPairsFlyMode = 1

map <Leader> <Plug>(easymotion-prefix)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[3 q'" 

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

