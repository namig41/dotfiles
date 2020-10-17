call plug#begin('~/.local/share/nvim/plugged')
	"Navigation Plugins
	
    Plug 'preservim/nerdtree'
    Plug 'easymotion/vim-easymotion'
	Plug 'justinmk/vim-sneak'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'kshenoy/vim-signature'
	Plug 'jeetsukumaran/vim-buffergator'

	"UI Plugins
	
	Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'wincent/terminus'
    Plug 'mkitt/tabline.vim'
	Plug 'romainl/vim-cool'
    Plug 'szw/vim-tags'

	"Editor plugins
	
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/vim-cursorword'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'tpope/vim-surround'
	Plug 'wellle/vim-repeat'
    Plug 'tpope/vim-commentary'
	Plug 'ervandew/supertab'

	"Other

    Plug 'ekalinin/Dockerfile.vim'
	Plug 'vim-scripts/ruscmd'
call plug#end()

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

set number

set showmatch
set hlsearch
set incsearch
set cindent

set visualbell
set noswapfile
set ruler

syntax enable
set bg=dark
colorscheme nord

let g:mapleader=','
let g:auto_save = 1
let g:sneak#label = 1

map f <Plug>Sneak_s
map F <Plug>Sneak_S

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

imap jk <Esc>
vmap aa <Esc>

nmap <silent> T :NERDTree<CR>
nmap <silent> t :FZF<CR>
nmap <silent> <c-f> :Files<CR>
nmap <silent> <c-p> :Ag<CR>
nmap <silent> <Leader>r :TagsGenerate!<CR>

nmap K gt
nmap J gT

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

map <c-j> <c-d>
map <c-k> <c-u>

nmap <silent> <Leader>f :NERDTreeFind<CR>

map <Leader> <Plug>(easymotion-prefix)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>a $
map <Leader>i ^

map Q :wq<CR>
map <Leader>q :q!<CR>

nmap H gb

nnoremap <silent> <Leader>o o<Esc>k
nnoremap <silent> <Leader>O O<Esc>j

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[1 q'" 

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
 	set t_Co=256
endif
