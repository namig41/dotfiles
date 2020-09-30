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
	Plug 'jeetsukumaran/vim-buffergator'
	Plug 'justinmk/vim-sneak'
	Plug 'ervandew/supertab'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'wellle/vim-repeat'
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
set cindent
set visualbell
set noswapfile
set ruler
set nohlsearch
set clipboard=unnamed

syntax enable
colorscheme nord

let g:mapleader=','
let g:auto_save = 1
let g:sneak#label = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-w>"
let g:UltiSnipsEditSplit="vertical"

map f <Plug>Sneak_s
map F <Plug>Sneak_S

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

imap jk <Esc>
vmap aa <Esc>

nmap T :NERDTree<CR>
nmap t :FZF<CR>
nmap <c-f> :Files<CR>
nmap <c-p> :Ag<CR>

nmap <Leader>r :TagsGenerate!<CR>

nmap K gt
nmap J gT

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

map <c-j> <c-d>
map <c-k> <c-u>

nmap <Leader>f :NERDTreeFind<CR>

map <Leader> <Plug>(easymotion-prefix)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>a $
map <Leader>i ^

map Q :wq<CR>
map <Leader>q :q!<CR>
nmap <Leader>s :sh<CR>

nmap H gb

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[1 q'" 

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
 	set t_Co=256
endif

