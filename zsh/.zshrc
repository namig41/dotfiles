# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/namig/.oh-my-zsh"
export TERM="xterm-256color"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case, # to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="arrow/arrow"
ZSH_THEME_VIRTUALENV_PREFIX='('
ZSH_THEME_VIRTUALENV_SUFFIX=')'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true" # Uncomment the following line to change how often to auto-update (in days). 
# # export UPDATE_ZSH_DAYS=13 # Uncomment the following line if pasting URLs and other text is messed up.  # DISABLE_MAGIC_FUNCTIONS=true # Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#

export FZF_BASE=/path/to/fzf/install/dir

plugins=(
    git
	zsh-autosuggestions
	zsh-syntax-highlighting
	alias-finder
	autojump
	vi-mode
	vscode
	fzf
	docker
	docker-compose
	systemd
	virtualenv
	pip
)

# User configuration
source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept

LS_COLORS="di=36:*.o=35:ex=32:*.a=31:*.pdf=35:*.c=04;36"  


function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[green]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

ch () { chmod +x $*;}
qt () { qtcreator $* &;}
n () { nautilus $* > /dev/null 2>&1 &;}
c () { cd "$@" && ls -al; }

alias e="/usr/bin/vim"
alias vim="/usr/bin/nvim"

alias zshc="nvim ~/.zshrc"
alias zshr="source ~/.zshrc"

alias vimc="nvim ~/.vimrc"
alias nvimc="nvim /home/namig/.config/nvim/init.vim"

alias m="make > /dev/null 2>&1 &"
alias mr="make re"
alias mcl="make clean"
alias mf="make fclean"

alias rmf="rm -rf"

alias gwt='git commit -am "$(curl -s whatthecommit.com/index.txt)"'
alias gmc='git commit -am "$(curl -s whatthecommit.com/index.txt)" && git push'

alias -1="cd ../"
alias -2="cd ../../"

alias open="xdg-open "

alias jp="jupyter notebook"
alias google="google-chrome > /dev/null 2>&1 &"

alias v="valgrind"
alias vf="valgrind --leak-check=full"

alias mat="matlab -nodesktop"

export LANG=en_US.utf8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
