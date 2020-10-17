set number
set mouse=a
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set clipboard=unnamed
set wrap
set autoindent
set ignorecase
set tabstop=4
set shiftwidth=4
set smartcase
set smartindent
set smarttab
set showmatch
set hlsearch
set incsearch
set cindent
set visualbell
set noswapfile
set ruler

if has('autocmd')
    filetype on
    filetype plugin on
    filetype indent on
endif

let g:mapleader=','

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

imap jk <Esc>
vmap aa <Esc>

nmap K gt
nmap J gT

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

map <c-j> <c-d>
map <c-k> <c-u>

map <Leader>a $
map <Leader>i ^

map Q :wq<CR>
map <Leader>q :q!<CR>

nmap H gb

nnoremap <silent> <Leader>o o<Esc>k
nnoremap <silent> <Leader>O O<Esc>j

call plug#begin('~/.local/share/nvim/plugged')

	"Navigation Plugins

	Plug 'kshenoy/vim-signature'
	Plug 'jeetsukumaran/vim-buffergator'
	
	Plug 'preservim/nerdtree'
	nmap <silent> T :NERDTree<CR>
	nmap <silent> <Leader>f :NERDTreeFind<CR>

	Plug 'easymotion/vim-easymotion'
	map  / <Plug>(easymotion-sn)zz
	omap / <Plug>(easymotion-tn)zz
	map  n <Plug>(easymotion-next)zz
	map  N <Plug>(easymotion-prev)zz
	map <Leader> <Plug>(easymotion-prefix)

	Plug 'justinmk/vim-sneak'
	let g:sneak#label = 1
	map f <Plug>Sneak_s
	map F <Plug>Sneak_S

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	nmap <silent> t :FZF<CR>
	nmap <silent> <c-f> :Files<CR>
	nmap <silent> <c-p> :Ag<CR>

	"UI Plugins
	
	Plug 'arcticicestudio/nord-vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
	Plug 'wincent/terminus'
	Plug 'mkitt/tabline.vim'
	Plug 'romainl/vim-cool'

	"Editor plugins
	
	Plug 'jiangmiao/auto-pairs'
	Plug 'itchyny/vim-cursorword'
	Plug 'tpope/vim-surround'
	Plug 'wellle/vim-repeat'
	Plug 'tpope/vim-commentary'
	Plug 'ervandew/supertab'

	Plug 'vim-scripts/vim-auto-save'
	let g:auto_save = 1

	Plug 'szw/vim-tags'
	nmap <silent> <Leader>r :TagsGenerate!<CR>

	"Other

	Plug 'ekalinin/Dockerfile.vim'
	Plug 'vim-scripts/ruscmd'

	Plug 'lervag/vimtex'
	let g:tex_flavor = 'latex'
	let g:vimtex_view_method='mupdf'

call plug#end()

if has('syntax')
	set bg=dark
	syntax enable
	colorscheme nord
endif

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
	set t_Co=256
endif

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[1 q'" 
